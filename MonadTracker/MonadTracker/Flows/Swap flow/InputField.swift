import SwiftUI

struct InputField: View {
    var title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(.white)
                .font(.subheadline)
            TextField("Enter \(title.lowercased())", text: $text)
                .keyboardType(keyboardType)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.black)
                .disableAutocorrection(true)
        }
    }
}
