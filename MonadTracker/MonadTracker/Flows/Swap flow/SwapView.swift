import SwiftUI

struct SwapView: View {
    
    @State private var fromToken: String = ""
    @State private var toToken: String = ""
    @State private var amount: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.85)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Swap Tokens")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 3, x: 0, y: 2)
                    .padding(.top, 20)
                
                VStack(spacing: 16) {
                    HStack {
                        InputField(title: "From", text: $fromToken)
                        Image(systemName: "arrow.left.arrow.right")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                        InputField(title: "To", text: $toToken)
                    }
                    
                    InputField(title: "Amount", text: $amount, keyboardType: .decimalPad)
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 4)
                .padding(.horizontal)
                
                // TODO: Swap logic here
                Button(action: {}) {
                    Text("SWAP NOW")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(sampleTickers) { ticker in
                            PriceTickerView(ticker: ticker)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
                
                MarketOverviewView()
                    .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SwapView()
}
