import SwiftUI

// MARK: - MOCK DATA FOR TICKERS



struct ContentView: View {
    var body: some View {
        TabView {
            SwapView()
                .tabItem {
                    Image(systemName: "arrow.2.squarepath")
                    Text("Swap")
                }
            
            PortfolioView()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Portfolio")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
//        .tint(.white)
    }
}

#Preview {
    ContentView()
}
