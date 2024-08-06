//
//  TransactionItemView.swift
//  BankingApp
//
//  
//

import SwiftUI

struct TransactionItemView: View {
    @State var title: String
    @State var icon: ImageResource
    //var amount: String
    var body: some View {
        ZStack {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding(.all, 5)
                    .cornerRadius(10)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .padding(.all, 25)
        }
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
        }
        .frame(height: 50)
    }
    
    
}

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView(title: "Google Pay", icon: .google)
            .previewLayout(.sizeThatFits)
    }
}
