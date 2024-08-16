//
//  SignupView.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            // Logo or App Name
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            // Email TextField
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Password TextField
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Confirm Password TextField
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Sign Up Button
            Button(action: signUp) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up")
    }
    
    private func signUp() {
        // Implement your sign-up logic here
        if password == confirmPassword {
            print("Sign Up with email: \(email) and password: \(password)")
        } else {
            print("Passwords do not match")
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

