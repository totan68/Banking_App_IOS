import SwiftUI

struct ShareCardView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                HStack(alignment: .bottom) {
                    // Left Section
                    VStack(alignment: .leading) {
                        // Horizontal stack for Profile and Feedback buttons
                        HStack {
                            // Profile Button
                            NavigationLink(destination: ProfiledetailsScreen()) {
                                Image(systemName: "person.circle.fill") // Placeholder image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                    .padding(.top, 10) // Spacing between text and circle
                            }
                            .padding(.trailing, 10) // Space between profile and feedback button
                            
                            // Feedback Button
                            NavigationLink(destination: FeedBackScreen()) {
                                Image(systemName: "message.fill") // Feedback icon
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
                                    .frame(width: 80, height: 30)
                                    .foregroundColor(.blue) // Color of the feedback icon
                                    .padding()
                                    .background(Color.white) // Background color of the button
                                    .clipShape(Circle()) // Make the background circular
                                    .shadow(radius: 10) // Optional shadow
                            }
                        }
                        
                        Text("Profile")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                        
                        
                        
                       
                        
                        LazyHStack(spacing: -5) {
                            ForEach(avatars, id: \.self) { value in
                                CircularImageView(image: value, size: 40)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(.black, lineWidth: 1)
                                    }
                            }
                        }
                        .frame(height: 60)
                    }
                    
                    Spacer()
                    
                    // Right Section
                    ZStack {
                        
                    }
                    .background(Color("purple"))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color("dark"))
            .cornerRadius(25)
            .padding(.horizontal)
            .padding(.top, 30)
        }
    }
}

struct ShareCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShareCardView()
            .previewLayout(.sizeThatFits)
    }
}

