
import SwiftUI

struct ViewsallScreen: View {
    let transactions = [
        ("16-04-2001", "1000", "0", "1000"),
        ("17-04-2001", "500", "200", "1500"),
        ("18-04-2001", "0", "150", "1650"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750"),
        ("19-04-2001", "0", "100", "1750")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Sticky Header
            VStack {
                // Header text
                Text("A/C No: 26733211036456")
                    
                    .font(.headline)
                    .fontWeight(.bold)
                
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                
                // Table header
                HStack {
                    headerText("Date")
                    headerText("Withdrawal")
                    headerText("Deposit")
                    headerText("Balance")
                }
                .background(Color.gray.opacity(60))
                .cornerRadius(10)
            }
            .background(Color.gray) // Sticky header background
            .shadow(radius: 5) // Optional shadow for sticky header
            .padding(.bottom, 20) // Space between header and rows
            
            // ScrollView for transactions
            ScrollView {
                VStack(spacing: 10) {
                    // Table rows
                    ForEach(transactions, id: \.0) { transaction in
                        transactionRow(transaction: transaction)
                            .padding(.horizontal)
                            .transition(.slide) // Animation for row appearance
                    }
                }
            }
            .background(Color(.orange)) // Background color for the scrollable area
        }
        .padding()
    }
    
    private func headerText(_ text: String) -> some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 2)
            .padding(.horizontal, 2)
            .background(Color.white)
            .cornerRadius(3)
    }
}

struct transactionRow: View {
    let transaction: (String, String, String, String)
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.0)
                    .font(.subheadline)
                    .padding()
            }
            VStack(alignment: .leading) {
                Text(transaction.1)
                    .font(.subheadline)
                    .padding()
                    .foregroundColor(.red)
            }
            VStack(alignment: .leading) {
                Text(transaction.2)
                    .font(.subheadline)
                    .padding()
                    .foregroundColor(.blue)
            }
            VStack(alignment: .leading) {
                Text(transaction.3)
                    .font(.subheadline)
                    .padding()
                    .foregroundColor(.green)
            }
        }
        .padding(4)
        .background()
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ViewsallScreen()
}
