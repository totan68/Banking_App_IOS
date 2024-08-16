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
    @State private var showValidationAlert: Bool = false
    
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
                   
//                    if !recipientName.isEmpty || !recipientAmount.isEmpty {
//                        recipientManager.addRecipient(name: recipientName, amount: Double(recipientAmount)!)
//                        presentationMode.wrappedValue.dismiss()
                    if validateFields() {
                                            if let amount = Double(recipientAmount) {
                                                recipientManager.addRecipient(name: recipientName, amount: amount)
                                                presentationMode.wrappedValue.dismiss() // Dismiss the view
                                            }
                                        } else {
                                            showValidationAlert = true
                                        }
//                    }
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
//                .disabled(!validateFields())
                
                
                
                
                Spacer()
            }
            .navigationTitle("Add Recipient")
            .alert(isPresented: $showValidationAlert) {
                            Alert(
                                title: Text("Validation Error"),
                                message: Text("Please add recipient details in order to initiate the transaction."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
        }
    }
                          private func validateFields() -> Bool {
                                  // Check if fields are not empty and amount is a valid number
                                  return !recipientName.isEmpty && !recipientAmount.isEmpty && Double(recipientAmount) != nil
                              }
}


#Preview {
    AddRecipientView(recipientManager: RecipientManager())
}
