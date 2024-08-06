






import SwiftUI

struct ContentView: View {
    @StateObject private var recipientManager = RecipientManager()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // MARK: - Top Bank Card Section
                NavigationStack{
                    VStack {
                        BankCardView(balance: "")
                            .zIndex(1)
                        ShareCardView()
                            .offset(y: -30)
                    }
                }
                .padding(.top, 3)
                
                // MARK: - Middle Section
                Text("Amount")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 5)
                
                HStack {
                    Text("₹ \(formattedAmount(recipientManager.totalAmount))")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: AmountScreen()) {
                        Image(systemName: "arrow.forward")
                            .padding(.vertical)
                            .padding(.horizontal, 40)
                            .background(Color("green"))
                            .cornerRadius(10)
                            .foregroundColor(.black) // Ensure the arrow is visible on the green background
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
                   
               
                
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Hello")
                        .font(.system(size: 30))
                        .fontWeight(.light)
                    Text("User")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "bell.badge")
                        .foregroundStyle(Color.red, Color.black)
                    CircularImageView(image: .avatar, size: 30)
                        .padding(.leading)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
