//
//  TransactionsRow.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 06/08/24.
//

import Foundation
import SwiftUI

struct TransactionRow: View {
    var item: Int
    var amount: [Int] = [610, 975, 880, 425, 767, 843, 154, 899, 100, 405]
    var dates: [String] = ["12 Nov 2023  11:08", "11 Feb 2024 16:55", "19 Jun 2024 14:02", "15 Dec 2023 18:05", "02 Jun 2024 19:50", "08 Apr 12:00", "25 Dec 2023 13:45", "22 Jan 2024 12:30", "05 May 2024 07:23"]
    var body: some View {
        HStack {
            Image("visaIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Friend \(item)")
                    .font(.headline)
                Text(dates.randomElement() ?? "27 Mar 2023 09:59")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("-₹\(amount.randomElement() ?? 89)")
                .font(.headline)
        }
        .padding(8)
    }
}

#Preview {
    TransactionRow(item: 1)
}
