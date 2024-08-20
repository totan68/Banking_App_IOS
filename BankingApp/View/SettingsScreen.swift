//
//  SettingsScreen.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email: String = "user@example.com"
    @State private var newEmail: String = ""
    @State private var newFullname: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var enableNotifications: Bool = true
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var showingAbout = false
    @State private var showingContactSupport = false
    
    var body: some View {
        NavigationStack {
        Form {
            Section(header: Text("Account")) {
                HStack {
                    Text("Email")
                    Spacer()
                    Text(email)
                        .foregroundColor(.gray)
                }
                
                TextField("New Email", text: $newEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                TextField("New Full Name", text: $newFullname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.default)
                
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $newPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        SecureField("Password", text: $newPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    if isConfirmPasswordVisible {
                        TextField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button(action: {
                        isConfirmPasswordVisible.toggle()
                    }) {
                        Image(systemName: isConfirmPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action:{ Task{await updateAccount()}}) {
                    Text("Update Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                }
            }
            
            Section(header: Text("Preferences")) {
                Toggle("Enable Notifications", isOn: $enableNotifications)
                
                Button(action: logout) {
                    HStack{
                        Image(systemName: "arrow.left.square")
                        Text("Logout")
                    }
                    .foregroundColor(.red)
                }
            }
            Section(header: Text("Mode")){
                Toggle("Dark Mode", isOn: $isDarkMode)
            }
            
            Section(header: Text("About")) {
//                NavigationLink(destination: AboutView()) {
//                    Text("About This App")
//                        .foregroundColor(.blue)
//                }
//                
//                NavigationLink(destination: ContactSupportView()) {
//                    Text("Contact Support")
//                        .foregroundColor(.blue)
//                }
                Button{
                    showingAbout.toggle()
                } label: {
                    Text("About This App")
                }
                Button(action: {showingContactSupport.toggle()}){
                    Text("Contact Support")
                }
            }
            
        }
        .sheet(isPresented: $showingAbout, content: {
            AboutView()
        }).sheet(isPresented: $showingContactSupport, content: {
            ContactSupportView()
        })
        .navigationTitle("Settings")
    }
    }
    
    private func updateAccount() async {
        if newPassword == confirmPassword {
            await viewModel.updateUser(fullname: newFullname, email: newEmail, password: newPassword)
            // Perform update logic
        } else {
            print("Passwords do not match.")
        }
    }
    
    private func logout() {
        viewModel.signOut()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthViewModel())
    }
}

