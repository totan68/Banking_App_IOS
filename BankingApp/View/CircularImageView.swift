//
//  CircularImageView.swift
//  BankingApp
//
//  
//

import SwiftUI

struct CircularImageView: View {
    let image: ImageResource
    let size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: .avatar, size: 50)
            .previewLayout(.sizeThatFits)
    }
}
