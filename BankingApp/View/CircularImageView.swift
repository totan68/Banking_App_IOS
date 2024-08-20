//
//  CircularImageView.swift
//  BankingApp
//
//  
//

import SwiftUI

struct CircularImageView: View {
    let image: UIImage?
    let size: CGFloat
    
    var body: some View {
        Group {
                    if let uiImage = image {
                        Image(uiImage: uiImage)
                            .resizable()
                    } else {
                        // Fallback image or a placeholder
                        Image(systemName: "person.circle.fill")
                            .resizable()
                    }
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .clipShape(Circle())
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: UIImage(systemName: "person.circle.fill"), size: 100)
            .previewLayout(.sizeThatFits)
    }
}
