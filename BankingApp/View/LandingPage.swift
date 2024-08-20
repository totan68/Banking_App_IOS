//
//  LandingPage.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI

struct LandingPageView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack {
                
                VStack(alignment: .leading) {
                    // Welcome Section
                    Text("Welcome, \(user.firstName)!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    // User Profile Section
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Name:")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Text(user.fullname)
                                    .font(.subheadline)
                            }
                            HStack{
                                Text("Email:")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Text(user.email)
                                    .font(.footnote)
                                    
                            }
                            Text("Member since: January 2024")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                    }
                    .padding()
                    
                    // Navigation Buttons
                    VStack(spacing: 15) {
                        NavigationLink(destination: MainDashboard().navigationBarBackButtonHidden(true)) {
                            Text("Home")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            Task{
                                await viewModel.deleteAccount()
                            }
                        }, label: {
                            HStack {
                                    Image(systemName: "trash")
                                    .imageScale(.large)
                                    Text("Delete Account")
                                    .fontWeight(.bold)
                                }
                                .foregroundColor(.red)
                                
                        })
                    }
                    .padding()
                    
                    Spacer()
                }
                .navigationTitle("")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                                .imageScale(.large)
                                
                        }
                    }
                }
            }
        }

    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
            .environmentObject(AuthViewModel())
    }
}

