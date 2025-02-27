import SwiftUI

struct TokenCardView: View {
    let token: Token
    let percentage: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(token.name)
                .font(.headline)
                .foregroundColor(.white)
            HStack {
                Text(token.symbol)
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
                Text(String(format: "%.2f%%", percentage))
                    .foregroundColor(.yellow)
            }
            .font(.subheadline)
            
            Text(String(format: "%.2f USD", token.totalValue))
                .foregroundColor(.white.opacity(0.9))
            
            ProgressView(value: percentage, total: 100)
                .tint(.green)
                .progressViewStyle(LinearProgressViewStyle())
        }
        .padding()
        .background(LinearGradient(
            gradient: Gradient(colors: [.blue, .purple]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        )
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
    }
}

#Preview {
    TokenCardView(
        token: Token(
            name: "Test",
            symbol: "TST",
            balance: 100,
            price: 100
        ),
        percentage: 25
    )
}
