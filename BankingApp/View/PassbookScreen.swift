//
//  PassbookScreen.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 06/08/24.
//


//
//  ViewsallScreen.swift
//  BankingApp
//
//  Created by Totan Hazra on 05/08/24.
//
 
import SwiftUI
 
struct ViewsallScreen: View {
    let transactions = [
        ("16-04-2001", "1000", "0", "1000"),
        ("17-04-2001", "500", "200", "1500"),
        ("18-04-2001", "0", "150", "1650"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750"),
        ("19-04-2001", "0","100","1750")
        
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                // Header text
                Text("A/C No: 26733211036456")
                    .fontWeight(.bold)
                    .padding()
                
                // Table header
                HStack {
                    Text("Date")
                        .padding()
                    Text("Withdrawal")
                        
                        .padding()
                    Text("Deposit")
                        .padding()
                    Text("Balance")
                        .padding()
                }
                .fontWeight(.bold)
                
                // Table rows
                ForEach(transactions, id: \.0) { transaction in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(transaction.0)
                                .padding()
                        }
                        VStack(alignment: .leading) {
                            Text(transaction.1)
                                .padding()
                                .foregroundColor(.red)
                        }
                        VStack(alignment: .leading) {
                            Text(transaction.2)
                                .padding()
                                .foregroundColor(.blue)
                        }
                        VStack(alignment: .leading) {
                            Text(transaction.3)
                                .padding()
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }
                    Divider() // Optional: Adds a separator line between rows
                }
                
                Spacer()
                    .ignoresSafeArea()
            }
            .padding()
        }
    }
}
 
#Preview {
    ViewsallScreen()
}
 
