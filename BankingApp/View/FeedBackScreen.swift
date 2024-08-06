//
//  FeedBackScreen.swift
//  BankingApp
//
//  Created by Totan Hazra on 05/08/24.
//
import SwiftUI
import UIKit

struct CustomTextEditor: UIViewRepresentable {
    @Binding var text: String
    var autocapitalization: UITextAutocapitalizationType = .sentences
    var autocorrection: UITextAutocorrectionType = .no
    var spellChecking: UITextSpellCheckingType = .no
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.autocapitalizationType = autocapitalization
        textView.autocorrectionType = autocorrection
        textView.spellCheckingType = spellChecking
        textView.delegate = context.coordinator
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            text = textView.text
        }
        
        struct SubmissionMessage: Identifiable {
            var id: UUID = UUID() // Unique identifier
            let message: String
        }
    }
}

struct FeedbackScreen: View {
    @State private var feedbackText: String = ""
    @State private var rating: Int = 1
    @State private var isSubmitting: Bool = false
    @State private var submissionMessage: SubmissionMessage?

    let maxRating = 5

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rate Your Experience")) {
                    HStack {
                        ForEach(1...maxRating, id: \.self) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .foregroundColor(index <= rating ? .yellow : .gray)
                                .onTapGesture {
                                    rating = index
                                }
                        }
                    }
                }

                Section(header: Text("Feedback")) {
//                    TextEditor(text: $feedbackText)
//                        .frame(height: 150)
//                        .border(Color.gray, width: 1)
                    CustomTextEditor(text: $feedbackText, autocorrection: .no)
                        
                                            .frame(height: 150)
                                            .border(Color.gray.opacity(0.5), width: 1)
                                            .cornerRadius(7)
                                            .font(.title3)
                }

                Section {
                    Button(action: submitFeedback) {
                        if isSubmitting {
                            ProgressView()
                        } else {
                            Text("Submit Feedback")
                        }
                    }
                    .disabled(isSubmitting) // Disable button while submitting
                }
            }
            .navigationTitle("Feedback")
            .alert(item: $submissionMessage) { submissionMessage in
                Alert(title: Text("Feedback Submitted"), message: Text(submissionMessage.message), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func submitFeedback() {
        isSubmitting = true

        // Simulate a network request or processing
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isSubmitting = false
            feedbackText = feedbackText
            rating = rating
            submissionMessage = SubmissionMessage(message: "Thank you for your feedback! Your rating: \(rating)")
        }
    }
}

struct SubmissionMessage: Identifiable {
    var id: UUID = UUID() // Unique identifier
    let message: String
}

struct FeedbackScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackScreen()
    }
}
