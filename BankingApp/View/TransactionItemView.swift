//
//  TransactionItemView.swift
//  BankingApp
//
//  
//

import SwiftUI

struct TransactionItemView: View {
    @State private var isAddRecipientPresented: Bool = false
    @StateObject private var recipientManager = RecipientManager()

    var body: some View {
        VStack(spacing: -40) {
                    TransactionsHeader(isAddRecipientPresented: $isAddRecipientPresented)
                        .environmentObject(recipientManager)
                    
            
                LazyVStack {
                    ScrollView(.vertical, showsIndicators: false) {
                            ForEach(recipientManager.recipients) { recipient in
                                
                                HStack{
                                    Image(.visaIconImageset)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 30, height: 30)
                                                    .padding(5)
                                    VStack(alignment: .leading){
                                        
                                            Text(recipient.name)
                                            .font(.headline)
                                            
                                        
                                            Text("\(recipient.dateAdded, formatter: dateFormatter)")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        
                                }
                                    Spacer()
                                    Text("- ₹ \(formattedAmount(recipient.amount))")
                                        .font(.headline)
                                        .foregroundStyle(.red)
                                    
                                }
                                .padding(8)
                                    
                            }
                        }
                        .background(Color.white)
                    .cornerRadius(20)
            }
                }
                .padding(.horizontal)
                .sheet(isPresented: $isAddRecipientPresented) {
                    AddRecipientView(recipientManager: recipientManager)
                }
    }
    private func formattedAmount(_ amount: Double) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        }
    
}

// DateFormatter for displaying the date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView()
            .previewLayout(.sizeThatFits)
            .background(Color.gray.opacity(0.2)) 
    }
}
