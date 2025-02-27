import SwiftUI

struct PriceTicker: Identifiable {
    let id = UUID()
    let symbol: String
    let price: Double
    let change: Double
}

let sampleTickers: [PriceTicker] = [
    PriceTicker(symbol: "BTC", price: 118000, change: 2.5),
    PriceTicker(symbol: "ETH", price: 5350, change: -1.2),
    PriceTicker(symbol: "ADA", price: 0.45, change: 3.1),
    PriceTicker(symbol: "DOT", price: 6.5, change: -0.8)
]

struct PriceTickerView: View {
    let ticker: PriceTicker
    
    var body: some View {
        HStack(spacing: 4) {
            Text(ticker.symbol)
                .font(.headline)
                .foregroundColor(.white)
                .padding(4)
                .background(Color.blue.opacity(0.7))
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 2) {
                Text(String(format: "$%.2f", ticker.price))
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(String(format: "%+.2f%%", ticker.change))
                    .font(.caption)
                    .foregroundColor(ticker.change >= 0 ? .green : .red)
            }
        }
        .padding(8)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    PriceTickerView(
        ticker: PriceTicker(
            symbol: "BTC",
            price: 118020.23,
            change: 0.2
        )
    )
}
