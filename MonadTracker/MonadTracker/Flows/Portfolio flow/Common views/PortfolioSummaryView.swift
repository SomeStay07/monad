import SwiftUI

struct PortfolioSummaryView: View {
    let totalValue: Double
    let tokenCount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Total Portfolio Value")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                Text(String(format: "$%.2f", totalValue))
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text("Tokens")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                Text("\(tokenCount)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.5), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    PortfolioSummaryView(totalValue: 25, tokenCount: 23)
}
