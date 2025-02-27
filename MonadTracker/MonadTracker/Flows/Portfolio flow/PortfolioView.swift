import SwiftUI

struct PortfolioView: View {
    
    @StateObject private var viewModel = PortfolioViewModel()
    
    @State private var selectedChart: ChartType = .pie
    @State private var searchText: String = ""
    
    let sampleCandles: [Candle] = [
        Candle(date: Date(), open: 2.5, high: 3.0, low: 2.0, close: 2.8),
        Candle(date: Date().addingTimeInterval(3600), open: 2.8, high: 3.2, low: 2.6, close: 3.0),
        Candle(date: Date().addingTimeInterval(7200), open: 3.0, high: 3.5, low: 2.9, close: 3.2),
        Candle(date: Date().addingTimeInterval(10800), open: 3.2, high: 3.4, low: 3.0, close: 3.1),
        Candle(date: Date().addingTimeInterval(14400), open: 3.1, high: 3.3, low: 2.8, close: 3.0)
    ]
    
    var filteredTokens: [Token] {
        if searchText.isEmpty {
            return viewModel.tokens
        } else {
            return viewModel.tokens.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.symbol.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var totalPortfolioValue: Double {
        viewModel.tokens.reduce(0) { $0 + $1.totalValue }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.9)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Your Monad Portfolio")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                viewModel.fetchTokens()
                            }) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search tokens...", text: $searchText)
                                .tint(.white)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        PortfolioSummaryView(
                            totalValue: totalPortfolioValue,
                            tokenCount: filteredTokens.count
                        )
                        .padding(.horizontal)
                        
                        Picker("Chart Type", selection: $selectedChart) {
                            ForEach(ChartType.allCases) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(filteredTokens) { token in
                                NavigationLink(destination: TokenDetailView(token: token)) {
                                    TokenCardView(token: token, percentage: viewModel.portfolioPercentage(for: token))
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Group {
                            if selectedChart == .pie {
                                PieChart3DView(
                                    viewModel: viewModel,
                                    tokens: viewModel.tokens
                                )
                                    .frame(width: 250, height: 250)
                            } else {
                                CandlestickChartView(candles: sampleCandles)
                                    .frame(height: 250)
                            }
                        }
                        .padding()
                        .transition(.opacity)
                        .animation(.easeInOut, value: selectedChart)
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    PortfolioView()
}
