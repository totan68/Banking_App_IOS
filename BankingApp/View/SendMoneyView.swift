//
//  SendMoneyView.swift
//  BankingApp
//
//  Created by Totan Hazra on 08/08/24.
//

import SwiftUI

struct SendMoneyView: View {
    @EnvironmentObject var recipientManager: recipientManager
    @State private var amountToSend: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Send Money")
                .font(.title)
                .padding()
            
            TextField("Enter amount", text: $amountToSend)
                .keyboardType(.decimalPad)
                .padding()
                .border(Color.gray, width: 1)
                .padding(.horizontal, 20)
            
            Button(action: {
                if let amount = Double(amountToSend) {
                    recipientManager.sendMoney(amount: amount)
                    if recipientManager.showAlert {
                        showingAlert = true
                    }
                }
            }) {
                Text("Send")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Insufficient Funds"),
                    message: Text("You do not have enough funds to complete this transaction."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationTitle("Send Money")
    }
}

#Preview {
    SendMoneyView()
        .environmentObject(RecipientManager())
}
