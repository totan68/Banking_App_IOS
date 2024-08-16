//
//  LoginView.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingSignUp = false
    
    var body: some View {
        NavigationStack {
            Image("OIP")
                .resizable()
                            .scaledToFit()
                            .frame(width: 700, height: 300) //
                            .padding()
            
            
            VStack {
                // Logo or App Name
                Text("")
                
                    
                    .scaledToFit()
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 1)
                
                // Email TextField
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Password TextField
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                
                // Log In Button
//                Button(action: LandingPageView()) {
//                    Text("Log In")
//                
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .font(.headline)
//                        .cornerRadius(10)
//                    
//                }
//                .padding()
                NavigationLink(destination: LandingPageView()) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                }
                .padding()
                
                
                
                // Sign Up Button
                NavigationLink(destination: SignupView()) {
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
            .padding(.horizontal, 20)
            .navigationTitle("Welcome ")
        }
    }
    
    private func logIn() {
        // Implement your login logic here
        print("Login with email: \(email) and password: \(password)")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
