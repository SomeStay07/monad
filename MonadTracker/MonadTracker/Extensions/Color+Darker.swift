import SwiftUI

extension Color {
    func darker(by percentage: CGFloat = 30.0) -> Color {
        self.opacity(0.9)
    }
}
