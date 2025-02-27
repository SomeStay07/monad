import Foundation

struct Token: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let balance: Double
    let price: Double
    
    var totalValue: Double {
        balance * price
    }
}
