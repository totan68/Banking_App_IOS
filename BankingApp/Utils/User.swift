//
//  User.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI
import Combine

class UserManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = ""
    
    func login(username: String, password: String) -> Bool {
        // Add your login logic here. For demonstration, we'll assume any non-empty username and password is valid.
        if !username.isEmpty && !password.isEmpty {
            self.username = username
            self.isLoggedIn = true
            return true
        }
        return false
    }
    
    func signup(username: String, password: String) -> Bool {
        // Add your signup logic here. For demonstration, we'll assume any non-empty username and password is valid.
        if !username.isEmpty && !password.isEmpty {
            self.username = username
            self.isLoggedIn = true
            return true
        }
        return false
    }
    
    func logout() {
        self.username = ""
        self.isLoggedIn = false
    }
}
