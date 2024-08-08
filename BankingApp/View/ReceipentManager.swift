//
//  ReceipentManager.swift
//  BankingApp
//
//  Created by Totan Hazra on 08/08/24.
//

import Foundation
import Combine

class recipientManager: ObservableObject {
    @Published var totalAmount: Double = 1000.0 // Initial balance for demonstration
    @Published var showAlert: Bool = false
    
    func sendMoney(amount: Double) {
        if amount > totalAmount {
            // Show alert if insufficient funds
            showAlert = true
        } else {
            // Deduct amount from total
            totalAmount -= amount
        }
    }
}
