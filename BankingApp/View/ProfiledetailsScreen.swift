//
//  ProfiledetailsScreen.swift
//  BankingApp
//
//  Created by Smirthi Sundar on 05/08/24.
//

import SwiftUI
 
struct ProfiledetailsScreen: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Profile").font(.headline)) {
                    HStack {
                        Text("Branch:")
                        Spacer()
                        Text("Tambaram")
                    }
                    HStack {
                        Text("Customer ID:")
                        Spacer()
                        Text("213")
                    }
                    HStack {
                        Text("Name:")
                        Spacer()
                        Text(viewModel.currentUser?.firstName ?? "User")
                    }
                    HStack {
                        Text("Address:")
                        Spacer()
                        Text("No.2, Natesan Nagar, Hasthinapuram, Chennai")
                    }
                    HStack {
                        Text("Mobile:")
                        Spacer()
                        Text("9940234121")
                    }
                    HStack {
                        Text("Residence:")
                        Spacer()
                        Text("600044")
                    }
                    HStack {
                        Text("Email ID:")
                        Spacer()
                        Text("smirthi@gmail.com")
                    }
                }
            }
            .navigationTitle("User Profile")
        }
    }
}
 
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfiledetailsScreen()
    }
}
