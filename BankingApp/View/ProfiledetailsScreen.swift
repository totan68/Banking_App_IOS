//
//  ProfiledetailsScreen.swift
//  BankingApp
//
//  Created by Smirthi Sundar on 05/08/24.
//

import SwiftUI
 
struct ProfiledetailsScreen: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var branches: [String] = ["Kolkata", "Chennai", "Pune", "Bengaluru", "Kochi", "Hyderabad", "Gurgaon"]
    @State var addresses: [String] = ["No.2, Natesan Nagar, Hasthinapuram, Chennai","14B BD 1st Lane, Kolkata", "23 Michaelnagar, near Airport, Kolkata"]
    @State var mobiles: [String] = ["9940234121", "9239100652", "8012273657"]
    @State var residences: [String] = ["600044", "700039", "800456"]
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage? = nil
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Info").font(.headline)) {
                    HStack{
                        Spacer()
                        Button(action: {
                            showImagePicker.toggle()
                        }) {
                            CircularImageView(image: selectedImage, size: 100)
                        }
                        Spacer()
                    }
                    HStack {
                        Text("Branch:")
                        Spacer()
                        Text(branches.randomElement()!)
                    }
                    HStack {
                        Text("Customer ID:")
                        Spacer()
                        Text(viewModel.currentUser!.id)
                    }
                    HStack {
                        Text("Name:")
                        Spacer()
                        Text(viewModel.currentUser?.fullname ?? "User")
                    }
                    HStack {
                        Text("Address:")
                        Spacer()
                        Text(addresses.randomElement()!)
                    }
                    HStack {
                        Text("Mobile:")
                        Spacer()
                        Text(mobiles.randomElement()!)
                    }
                    HStack {
                        Text("Residence:")
                        Spacer()
                        Text(residences.randomElement()!)
                    }
                    HStack {
                        Text("Email ID:")
                        Spacer()
                        Text("\(viewModel.currentUser!.firstName).\(viewModel.currentUser!.lastName)@gds.ey.com")
                    }
                }
            }
            .navigationTitle("Your Profile")
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}
 
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfiledetailsScreen()
            .environmentObject(AuthViewModel())
    }
}
