//
//  AuthViewModel.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 12/08/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreCombineSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: Users?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = Users(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async {
        guard let user = Auth.auth().currentUser else {
                    print("DEBUG: No user is signed in")
                    return
                }
                
                // Delete user data from Firestore
                do {
                    try await Firestore.firestore().collection("users").document(user.uid).delete()
                } catch {
                    print("DEBUG: Failed to delete user data with error \(error.localizedDescription)")
                }
                
                // Delete user from Firebase Authentication
                do {
                    try await user.delete()
                    self.userSession = nil
                    self.currentUser = nil
                } catch {
                    print("DEBUG: Failed to delete user with error \(error.localizedDescription)")
                }
    }
    
    func updateUser(fullname: String, email: String, password: String) async {
            guard let uid = Auth.auth().currentUser?.uid else {
                print("DEBUG: No user is signed in")
                return
            }
            
            // Create a new Users object with updated values
            var updatedUser = self.currentUser
            if updatedUser == nil {
                updatedUser = Users(id: uid, fullname: fullname, email: email)
            } else {
                updatedUser?.fullname = fullname
                updatedUser?.email = email
            }
            
            // Update user data in Firestore
            do {
                if let updatedUser = updatedUser {
                    let encodedUser = try Firestore.Encoder().encode(updatedUser)
                    try await Firestore.firestore().collection("users").document(uid).setData(encodedUser)
                    self.currentUser = updatedUser
                }
            } catch {
                print("DEBUG: Failed to update user data with error \(error.localizedDescription)")
            }
            // Update user email and password in Firebase Authentication
                do {
                    try await Auth.auth().currentUser?.updateEmail(to: email)
                    try await Auth.auth().currentUser?.updatePassword(to: password)
                } catch {
                    print("DEBUG: Failed to update email ans password with error \(error.localizedDescription)")
                }
        
        
            }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: Users.self)
        print("DEBUG: Current User is \(self.currentUser!)")
    }
}
