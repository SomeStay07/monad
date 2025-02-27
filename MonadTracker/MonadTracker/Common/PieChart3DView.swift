import SwiftUI

struct PieChart3DView: View {
    @ObservedObject var viewModel: PortfolioViewModel
    
    let tokens: [Token]
    let depth: CGFloat = 20
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(tokens.indices, id: \.self) { index in
                    let startAngle = angle(at: index - 1)
                    let endAngle = angle(at: index)
                    PieSliceShape(startAngle: startAngle, endAngle: endAngle)
                        .fill(color(for: index).darker(by: 20))
                        .offset(y: depth)
                }
                
                ForEach(tokens.indices, id: \.self) { index in
                    let startAngle = angle(at: index - 1)
                    let endAngle = angle(at: index)
                    PieSliceShape(startAngle: startAngle, endAngle: endAngle)
                        .fill(color(for: index))
                        .overlay(PieSliceShape(startAngle: startAngle, endAngle: endAngle)
                                    .stroke(Color.white, lineWidth: 1))
                }
            }
            .rotation3DEffect(.degrees(25), axis: (x: 1, y: 0, z: 0))
        }
    }
    
    private func angle(at index: Int) -> Angle {
        guard !tokens.isEmpty else { return .zero }
        let sum = tokens[0...max(0, index)].reduce(0) { $0 + viewModel.portfolioPercentage(for: $1) }
        return Angle(degrees: sum / 100 * 360)
    }
    
    private func color(for index: Int) -> Color {
        let colorSet: [Color] = [.red, .green, .blue, .orange, .purple, .pink, .yellow, .mint]
        return colorSet[index % colorSet.count]
    }
}

#Preview {
    PieChart3DView(
        viewModel: PortfolioViewModel(),
        tokens: [
            Token(name: "Bitcoin", symbol: "BTC", balance: 2, price: 118000),
            Token(name: "Ethereum", symbol: "ETH", balance: 17, price: 5338),
            Token(name: "ADA", symbol: "ADA", balance: 10000, price: 0.4)
        ]
    )
}
