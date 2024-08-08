//
//  TransactionHeader.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 06/08/24.
//

import SwiftUI

struct transactionRow: View {
    var item: Int
    var amount: Int
    var date: String
    
    var body: some View {
        HStack {
            Image("visaIcon") // Adjust this to your actual image asset or use a placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Friend \(item)")
                    .font(.headline)
                Text(date)
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("-₹\(amount)")
                .font(.headline)
        }
        .padding(8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(item: 1, amount: 610, date: "12 Nov 2023 11:08")
    }
}
