






import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // MARK: - Top Bank Card Section
                NavigationStack{
                    VStack {
                        BankCardView(balance: "24,098.00")
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
                    Text("500.00 INR")
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
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        
                        TransactionItemView(title: "Google Pay", icon: .google)
                        TransactionItemView(title: "Google Pay", icon: .google)
                        TransactionItemView(title: "Google Pay", icon: .google)
                        
                        
                        
                    }
                }
                .padding(.horizontal, 30)
                
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
