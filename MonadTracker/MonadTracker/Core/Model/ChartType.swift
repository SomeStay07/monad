import Foundation

enum ChartType: String, CaseIterable, Identifiable {
    case pie = "Pie Chart"
    case candle = "Candlestick"
    
    var id: String { self.rawValue }
}
