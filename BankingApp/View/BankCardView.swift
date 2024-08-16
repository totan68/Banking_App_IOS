//
//  BankCardView.swift
//  BankingApp
//
//  Created by LVMM on 27/04/2023.
//

import SwiftUI

struct BankCardView: View {
    
    let balance: String
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    // Left section
                    VStack(alignment: .leading) {
                        Image("credit-card")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                        
                        Spacer()
                        
                        HStack {
                            Text("Transaction Limit")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Image(systemName: "eye")
                                .font(.system(size: 13))
                                .foregroundColor(Color(.systemGray))
                        }
                        
                        Text("₹ \(balance)")
                            .padding(.top, 1)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    // Right section
                    VStack(alignment: .trailing) {
                        Label {
                            Text("HDFC Bank")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        } icon: {
                            Image(systemName: "globe.central.south.asia.fill")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Image("visa")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 60, alignment: .bottom)
                    }
                }
                .padding()
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color("green"))
        .cornerRadius(25)
        .padding(.horizontal)
    }
}

struct BankCardView_Previews: PreviewProvider {
    static var previews: some View {
        BankCardView(balance: "35000")
            .previewLayout(.sizeThatFits)
    }
}
