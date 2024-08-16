//
//  AmountScreen.swift
//  BankingApp
//
//  Created by Totan Hazra on 05/08/24.
//

import SwiftUI

struct AmountScreen: View {
    @EnvironmentObject var recipientManager: RecipientManager
    @State private var newAmount: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                Text("Manage Funds")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // Current Balance
                VStack(alignment: .leading) {
                    Text("Current Balance")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("₹ \(formattedAmount(recipientManager.totalAmount))")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }
                .padding()
                
                // Add Funds Section
                VStack(alignment: .leading) {
                    Text("Add Funds")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    HStack {
                        TextField("Enter amount", text: $newAmount)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        Button(action: {
                            addFunds()
                        }) {
                            Text("Add")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(Color("green"))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
                
                // Recent Transactions
                VStack(alignment: .leading) {
                    Text("Recent Transactions")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    List {
                        ForEach(recipientManager.recentTransactions) { transaction in
                            TransactionRowView(transaction: transaction)
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Amount Management")
            .navigationBarItems(trailing: Button("Done") {
                            // Dismiss the view
                            presentationMode.wrappedValue.dismiss()
                        })
        }
    }
    
    private func addFunds() {
        guard let amount = Double(newAmount), amount > 0 else { return }
        
        // Update the recipient manager with new funds
        recipientManager.addFunds(amount: amount)
        
        // Clear the input field
        newAmount = ""
        
    }
    
    private func formattedAmount(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}

struct TransactionRowView: View {
    let transaction: Transaction // Assume you have a Transaction model
    
    var body: some View {
        HStack {
            Text(transaction.description)
                .font(.body)
            
            Spacer()
            
            Text("₹ \(formattedAmount(transaction.amount))")
                .font(.body)
                .foregroundColor(transaction.amount >= 0 ? .green : .red)
        }
        .padding()
    }
    
    private func formattedAmount(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}

// Preview
struct AmountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AmountScreen()
            .environmentObject(RecipientManager())
    }
}
