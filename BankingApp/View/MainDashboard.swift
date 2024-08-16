//
//  MainDashboard.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 12/08/24.
//

import SwiftUI

struct MainDashboard: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var recipientManager = RecipientManager()
    @StateObject private var userManager = UserManager()
    @State private var isDrawerOpen = false // State to toggle drawer visibility
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Hello")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                            Text("\(viewModel.currentUser?.fullname ?? "User"),")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                        }
                        .padding(.leading, 25)
                        .padding(.top)
                        // MARK: - Top Bank Card Section
                        VStack {
                            BankCardView(balance: "\(formattedAmount(recipientManager.totalAmount + 10500))")
                                .zIndex(1)
                            ShareCardView()
                                .offset(y: -30)
                        }
                        .padding(.top, 3)
                        
                        // MARK: - Middle Section
                        Text("Available Balance")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("₹ \(formattedAmount(recipientManager.totalAmount))")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            Spacer()
                            NavigationLink{ AmountScreen()
                                    .navigationBarBackButtonHidden(true)
                                    .environmentObject(recipientManager)
                            } label: {
                                Image(systemName: "arrow.forward")
                                    .padding(.vertical)
                                    .padding(.horizontal, 40)
                                    .background(Color("green"))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal, 30)
                        
                        Divider()
                            .padding(.horizontal, 30)
                            .padding(.bottom)
                        
                        HStack {
                            Text("Transaction")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            
                            NavigationLink(destination: ViewsallScreen()) {
                                Text("View all")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .underline()
                            }
                            
                        }
                        .padding(.horizontal, 30)
                        
                        // MARK: - Transactions List
                        TransactionItemView()
                            .padding(.bottom, 30)
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                withAnimation {
                                    isDrawerOpen.toggle()
                                }
                            }) {
                                if !isDrawerOpen {
                                    Image(systemName: "line.horizontal.3") // Hamburger icon
                                        .foregroundColor(Color(.systemGray))
                                        .font(.title)
                                }
                            }
                        }
                        
                        ToolbarItem {
                            
                        }
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Image(systemName: "bell.badge")
                                .foregroundStyle(Color.red, Color(.systemGray))
                            NavigationLink{
                                LandingPageView()
                                    .navigationBarBackButtonHidden(true)
                                
                            }label: {
                                CircularImageView(image: .avatar, size: 30)
                                    .padding(.leading)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .alert(isPresented: $recipientManager.showAlert) {
                        Alert(
                            title: Text("Insufficient Funds"),
                            message: Text("Add money to your account for further transactions."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    // Drawer (Side Menu)
                    if isDrawerOpen {
                        Color.black.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation {
                                    isDrawerOpen = false
                                }
                                
                            }
                        
                    }
                    SideMenuView(isDrawerOpen: $isDrawerOpen)
                        .transition(.move(edge: .leading))
                        .zIndex(2)
                }
                .environmentObject(recipientManager)
                .environmentObject(userManager)
            }
        }
        
}

private func formattedAmount(_ amount: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 2
    return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}

#Preview {
    MainDashboard()
        .environmentObject(RecipientManager())
        .environmentObject(AuthViewModel())
}

struct SideMenuView: View {
    @Binding var isDrawerOpen: Bool
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Menu")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 50)
                Spacer()
            }
            .padding()
            
            // Menu Items
            List {
                NavigationLink(destination: ProfiledetailsScreen()) {
                    Text("Contact Page")
                }
                NavigationLink(destination: FeedbackScreen()) {
                    Text("Cards Page")
                }
                NavigationLink(destination: AmountScreen()) {
                    Text("Amount Screen")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .padding(.top)
            
            Spacer()
        }
        .frame(width: 250)
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
                .offset(x: isDrawerOpen ? -63 : -350)  // Adjust the offset based on drawer state
                .animation(.easeInOut, value: isDrawerOpen)
    }
}

