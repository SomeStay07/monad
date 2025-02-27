import SwiftUI

struct CandlestickChartView: View {
    let candles: [Candle]
    
    var body: some View {
        GeometryReader { geometry in
            let spacing: CGFloat = 4
            let width = (geometry.size.width - CGFloat(candles.count - 1) * spacing) / CGFloat(candles.count)
            let maxPrice = candles.map { $0.high }.max() ?? 1
            let minPrice = candles.map { $0.low }.min() ?? 0
            let priceRange = maxPrice - minPrice
            
            HStack(alignment: .bottom, spacing: spacing) {
                ForEach(candles) { candle in
                    let candleHeight = CGFloat((candle.close - candle.open) / priceRange) * geometry.size.height
                    let highPos = CGFloat((candle.high - minPrice) / priceRange) * geometry.size.height
                    let lowPos = CGFloat((candle.low - minPrice) / priceRange) * geometry.size.height
                    let bodyColor: Color = candle.close >= candle.open ? .green : .red
                    ZStack {
                        // Wick
                        Rectangle()
                            .fill(bodyColor)
                            .frame(width: 2, height: max(1, highPos - lowPos))
                        // Body
                        Rectangle()
                            .fill(bodyColor)
                            .frame(width: width * 0.6, height: abs(candleHeight))
                            .offset(y: candle.close >= candle.open
                                    ? -(geometry.size.height - CGFloat((candle.close - minPrice) / priceRange) * geometry.size.height) + abs(candleHeight)/2
                                    : -(geometry.size.height - CGFloat((candle.open - minPrice) / priceRange) * geometry.size.height) + abs(candleHeight)/2)
                    }
                    .frame(width: width, height: geometry.size.height, alignment: .bottom)
                }
            }
        }
    }
}

#Preview {
    CandlestickChartView(
        candles: [
            .init(date: Date(), open: 1, high: 2, low: 3, close: 4),
            .init(date: Date(), open: 1, high: 2, low: 3, close: 4)
        ]
    )
}
