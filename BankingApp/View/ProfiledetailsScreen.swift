//
//  ProfiledetailsScreen.swift
//  BankingApp
//
//  Created by Totan Hazra on 05/08/24.
//

import SwiftUI

struct UserProfileView: View {
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6) // Background color for the entire view
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Form {
                        Section(header: Text(" ").font(.headline).foregroundColor(.blue)) {
                            profileRow(label: "Branch:", value: "Tambaram")
                            profileRow(label: "Customer ID:", value: "213")
                            profileRow(label: "Name:", value: "Smirthi")
                            profileRow(label: "Address:", value: "No.2, Natesan Nagar, Hasthinapuram, Chennai")
                            profileRow(label: "Mobile:", value: "9940234121")
                            profileRow(label: "Residence:", value: "600044")
                            profileRow(label: "Email ID:", value: "smirthi@gmail.com")
                        }
                    }
                    .background(Color.white) // Background color for the Form
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .navigationTitle("User Profile")
        }
    }
    
    private func profileRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            
    }
}
