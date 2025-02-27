import SwiftUI

struct MarketOverviewView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Market Overview")
                .font(.headline)
                .foregroundColor(.white)
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Market Cap")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    Text("$1.8T")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("24h Volume")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    Text("$90B")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MarketOverviewView()
}
