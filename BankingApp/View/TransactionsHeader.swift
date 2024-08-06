//
//  TransactionHeader.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 06/08/24.
//

import Foundation
import SwiftUI

struct TransactionsHeader: View {
    @Binding var isAddRecipientPresented: Bool
    var body: some View {
        HStack {
            Text("Send money to")
                .font(.headline)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(Color("green"))
                .frame(width: 30, height: 30)
                .onTapGesture {
                    //add recepient
                    isAddRecipientPresented.toggle()
                }
            Text("Add recipient")
                .font(.headline)
        }
        .padding(20)
        .padding(.bottom, 40)
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.1019468382, green: 0.1058915928, blue: 0.1333118379, alpha: 1)))
        .cornerRadius(20)
    }
}

#Preview {
    TransactionsHeader(isAddRecipientPresented: .constant(false))
}
