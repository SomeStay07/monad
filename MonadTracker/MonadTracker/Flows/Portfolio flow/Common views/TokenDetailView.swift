import SwiftUI

struct TokenDetailView: View {
    let token: Token
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                TokenHeaderView(token: token)
                
                OverviewMetricsView(token: token)
                
                PriceChartView()
                    .frame(height: 200)
                    .padding(.horizontal)
                
                TokenAdditionalInfoView(token: token)
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.9)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TokenHeaderView: View {
    let token: Token
    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .frame(width: 90, height: 90)
                .overlay(
                    Text(token.symbol.prefix(1))
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                )
                .shadow(radius: 8)
            
            Text(token.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            Text(token.symbol)
                .font(.title3)
                .foregroundColor(.gray)
        }
    }
}

// Карточка с основными метриками
struct OverviewMetricsView: View {
    let token: Token
    var body: some View {
        HStack(spacing: 16) {
            MetricCard(title: "Balance", value: String(format: "%.2f", token.balance))
            MetricCard(title: "Price", value: String(format: "%.2f USD", token.price))
            MetricCard(title: "Total", value: String(format: "%.2f USD", token.totalValue))
        }
        .padding(.horizontal)
    }
}

struct MetricCard: View {
    let title: String
    let value: String
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            Text(value)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 4)
    }
}

struct PriceChartView: View {
    let data: [CGFloat] = [1.0, 1.5, 1.2, 1.8, 1.6, 2.0, 1.9]
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            let maxValue = data.max() ?? 1
            let minValue = data.min() ?? 0
            let diff = maxValue - minValue
            
            Path { path in
                for index in data.indices {
                    let x = width * CGFloat(index) / CGFloat(data.count - 1)
                    let y = height - ((data[index] - minValue) / diff * height)
                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing),
                    style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
            .animation(.easeInOut(duration: 1.0), value: data)
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

struct TokenAdditionalInfoView: View {
    let token: Token
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Additional Information")
                .font(.headline)
                .foregroundColor(.white)
            
            HStack(spacing: 16) {
                AdditionalInfoCard(title: "Market Cap", value: "$1.2B")
                AdditionalInfoCard(title: "24h Volume", value: "$500M")
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct AdditionalInfoCard: View {
    let title: String
    let value: String
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            Text(value)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.blue.opacity(0.7)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    TokenDetailView(
        token: Token(
            name: "Test Token",
            symbol: "TST",
            balance: 100.0,
            price: 100.0
        )
    )
}
