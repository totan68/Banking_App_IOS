//
//  Transaction.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 14/08/24.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    var description: String
    var amount: Double
    var date: Date
}
