//
//  LandingPage.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 08/08/24.
//

import SwiftUI

struct LandingPageView: View {
    @Environment(\.dismiss) var dismissed
//    @StateObject private var recipientManager = RecipientManager()
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                // Welcome Section
                Text("Welcome, User!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // User Profile Section
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading) {
                        Text("Email: user@example.com")
                            .font(.headline)
                        Text("Member since: January 2024")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                }
                .padding()
                
                // Navigation Buttons
                VStack(spacing: 15) {
                    NavigationLink(destination: ContentView()) {
                        Text("Home")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingSettings.toggle()
                    }) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            
                    }
                }
            }
            .sheet(isPresented: $isShowingSettings) {
//                SettingsView()
                Button {
                    dismissed()
                } label: {
                    HStack{
                        
                        Text("x Close")
                            .background(Color.red)
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }

    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

