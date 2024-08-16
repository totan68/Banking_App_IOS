//
//  SettingsScreen.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var email: String = "user@example.com"
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var enableNotifications: Bool = true
    
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
                    
                    SecureField("New Password", text: $newPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: updateAccount) {
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
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
                
                Section(header: Text("About")) {
                    Button(action: showAbout) {
                        Text("About This App")
                    }
                    
                    Button(action: contactSupport) {
                        Text("Contact Support")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func updateAccount() {
        // Implement the logic to update account information
        // For example, update the email and password
        if newPassword == confirmPassword {
            print("Updating email to \(newEmail) and password.")
            // Perform update logic
        } else {
            print("Passwords do not match.")
        }
    }
    
    private func logout() {
        // Implement the logout logic
        print("Logging out...")
        // For example, clear user session or tokens
    }
    
    private func showAbout() {
        // Show about information
        print("Showing about information...")
    }
    
    private func contactSupport() {
        // Show contact support options
        print("Contacting support...")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

