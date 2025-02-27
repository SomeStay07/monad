import SwiftUI

final class PortfolioViewModel: ObservableObject {
    @Published var tokens: [Token] = []
    
    init() {
        fetchTokens()
    }
    
    func fetchTokens() {
        tokens = [
            Token(name: "Monad Token A", symbol: "MTA", balance: 120, price: 2.9),
            Token(name: "Monad Token B", symbol: "MTB", balance: 45, price: 15.0),
            Token(name: "Monad Token C", symbol: "MTC", balance: 200, price: 1.2),
            Token(name: "Monad Token D", symbol: "MTD", balance: 60, price: 10.0)
        ]
    }
    
    func portfolioPercentage(for token: Token) -> Double {
        let total = tokens.reduce(0) { $0 + $1.totalValue }
        guard total > 0 else { return 0.0 }
        return (token.totalValue / total) * 100
    }
}
