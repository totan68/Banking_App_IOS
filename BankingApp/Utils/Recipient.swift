//
//  Recipient.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 06/08/24.
//

import Foundation

struct Recipient: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var dateAdded: Date
}

class RecipientManager: ObservableObject {
    @Published var recipients: [Recipient] = []
    @Published var totalAmount: Double = 75000.00 
    @Published var showAlert: Bool = false
    @Published var recentTransactions: [Transaction] = []
        
    func addFunds(amount: Double) {
           guard amount > 0 else { return }
           totalAmount = totalAmount + amount
           logTransaction(description: "Funds added", amount: amount)
       }
    func addRecipient(name: String, amount: Double) {
        let newRecipient = Recipient(name: name, amount: amount, dateAdded: Date())
        recipients.append(newRecipient)
        deductAmount(amount: amount)
                checkBalance()
    }
    private func deductAmount(amount: Double) {
        totalAmount = totalAmount - amount
        }
    private func checkBalance() {
            if totalAmount <= 0 {
                totalAmount = 0
                showAlert = true
            }
        }
    private func logTransaction(description: String, amount: Double) {
            let newTransaction = Transaction(description: description, amount: amount, date: Date())
            recentTransactions.insert(newTransaction, at: 0)
            if recentTransactions.count > 10 {
                recentTransactions.removeLast()
            }
        }
}
