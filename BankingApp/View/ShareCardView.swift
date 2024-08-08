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
                            Spacer()
                            // Profile Button
                            NavigationLink(destination:UserProfileView()) {
                                Image(systemName: "person.circle.fill") // Placeholder image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                    .padding(.top, 10) // Spacing between text and circle
                            }// Space between profile and feedback button
                            Spacer()
                            // Feedback Button
                            NavigationLink(destination: FeedbackScreen()) {
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
                            Spacer()
                            NavigationLink(destination: ViewsallScreen()) {
                                Image(systemName: "book") // Use the passbook system symbol
                                    .resizable() // Make the image resizable
                                    .aspectRatio(contentMode: .fit) // Maintain the aspect ratio of the image
                                    .frame(width: 30, height: 40) // Set the size of the circle
                                    .foregroundColor(.white) // Set the color of the image
                                    .padding() // Add padding around the image
                                    .background(Color.blue) // Background color for the circle
                                    .clipShape(Circle()) // Clip the image to a circle shape
                                    .shadow(radius: 10)
                            }
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            Text("Profile")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                            Spacer()
                            Text("Feedback")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                            Spacer()
                            Text("Passbook")
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        
                        
                       
                        
                        LazyHStack(spacing: -5) {
                            
//                                CircularImageView(image: .avatar, size: 40)
//                                    .overlay {
//                                        RoundedRectangle(cornerRadius: 50)
//                                            .stroke(.black, lineWidth: 1)
//                                    }
                           
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

