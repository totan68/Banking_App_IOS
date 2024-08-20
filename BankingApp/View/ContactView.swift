//
//  AboutView.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 14/08/24.
//

import SwiftUI
 
struct ContactSupportView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var message: String = ""
    @State private var showMessageSent = false
    @State private var buttonRotation = 0.0
    
    var body: some View {
                
                VStack(alignment: .center, spacing: 20) {
                    HStack{
                        Spacer()
                        Text("Contact Support")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .padding(.top, 30)
                                        .cornerRadius(10)
                                        .padding(.top, 40)
                        Spacer()
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle")
                                .imageScale(.large)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                    
                                Spacer()
                    
                                VStack(alignment: .leading, spacing: 15) {
                                    TextField("Name", text: $name)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                    
                                    TextField("Email", text: $email)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                    
                                    TextEditor(text: $message)
                                        .frame(height: 150)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .padding(10)
                    
                                    Spacer()
                    
                                    Button(action: {
                                        withAnimation {
                                            showMessageSent.toggle()
                                            buttonRotation += 360
                                        }
                                    }) {
                                        Spacer()
                                        Group {
                                            Button{} label: {
                                                HStack{
                                                    Text(showMessageSent ? "Message Sent!" : "Send Message")
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.bold)
                                                    Image(systemName: "paperplane.fill")
                                                        .foregroundColor(.white)
                                                        .rotationEffect(.degrees(buttonRotation))
                                                }
                                            }
                                            .padding()
                                            .background(.blue)
                                            .cornerRadius(10)
                                            Spacer()
                                        }
                    
                                    }
                                    .padding()
                                    .alert(isPresented: $showMessageSent) {
                                        Alert(title: Text("Support Message"), message: Text("Your message has been sent successfully!"), dismissButton: .default(Text("OK")))
                                    }
                                    
                                }
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(15)
                                .shadow(radius: 10)
                    
                                Spacer()
                }
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [ Color(.systemGray), Color.white, Color(.systemGray2)]), startPoint: .top, endPoint: .bottom))
                        .edgesIgnoringSafeArea(.all)
           
                    
    }
}
 
struct ContactSupportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContactSupportView()
        }
    }
}
 
