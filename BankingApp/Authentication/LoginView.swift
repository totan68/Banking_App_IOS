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
    @State private var isPasswordVisible: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            Image(.OIP)
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
                    .keyboardType(.emailAddress)
                    .padding()
                
                // Password TextField
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing)
                }
                .padding()
                    
                
                // Log In Button
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
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
//                NavigationLink(destination: SignupView().navigationBarBackButtonHidden(true)) {
//                    Text("Sign Up")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .font(.headline)
//                        .cornerRadius(10)
//                }
                NavigationLink{
                    SignupView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Welcome")
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
