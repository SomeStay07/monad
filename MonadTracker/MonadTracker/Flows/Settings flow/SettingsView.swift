import SwiftUI

struct SettingsView: View {
    @State private var firstName: String = "John"
    @State private var lastName: String = "Doe"
    @State private var is2FAEnabled: Bool = false
    @State private var selectedTheme: String = "System"
    @State private var avatarImage: Image? = Image(systemName: "person.crop.circle")
    
    @State private var isWalletConnected: Bool = false
    
    let themes = ["System", "Light", "Dark"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    HStack {
                        avatarImage?
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.trailing, 8)
                        
                        VStack(alignment: .leading) {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                        }
                    }
                    
                    // TODO: - Change ava
                    
                    Button("Change Avatar") {}
                }
                
                Section(header: Text("Security")) {
                    Toggle("Enable 2FA", isOn: $is2FAEnabled)
                    
                    if is2FAEnabled {
                        Text("2FA is enabled for extra protection.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("Appearance")) {
                    Picker("App Theme", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme).tag(theme)
                        }
                    }
                }
                
                Section(header: Text("Wallet Connection")) {
                    HStack {
                        Text("Monad Wallet")
                        
                        Spacer()
                        
                        if isWalletConnected {
                            Text("Connected").foregroundColor(.green)
                        } else {
                            Text("Not Connected").foregroundColor(.red)
                        }
                    }
                    
                    Button(isWalletConnected ? "Disconnect" : "Connect") {
                        isWalletConnected.toggle()
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
