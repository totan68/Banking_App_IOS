//
//  AddRecipients.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 06/08/24.
//

import SwiftUI

struct AddRecipientView: View {
    @Environment(\.presentationMode) var presentationMode
//    @Binding var isPresented: Bool
    @ObservedObject var recipientManager: RecipientManager
    @State private var recipientName: String = ""
    @State private var recipientAmount: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Recipient Name", text: $recipientName)
                    .keyboardType(.alphabet)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .padding()
                TextField("Amount", text: $recipientAmount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button {
//                    // Handle adding the recipient
//                    print("Recipient Added: \(recipientName)")
//                    // Dismiss the view
//                    isPresented = false
                    if !recipientName.isEmpty || !recipientAmount.isEmpty {
                        recipientManager.addRecipient(name: recipientName, amount: Double(recipientAmount) ?? 0.00)
                        presentationMode.wrappedValue.dismiss() // Dismiss the view
                                        }
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .padding(3)
                            .foregroundColor(Color("green"))
                        .cornerRadius(20)
                        Text("Add Recipient")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 5)
                    .background(.black)
                    .cornerRadius(10)
                }
                
                
                
                
                Spacer()
            }
            .navigationTitle("Add Recipient")
        }
    }
}


#Preview {
    AddRecipientView(recipientManager: RecipientManager())
}
