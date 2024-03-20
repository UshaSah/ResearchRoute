import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: LoginView()) {
                Text("Login")
            }
            
            NavigationLink(destination: SignUpView()) {
                Text("Signup")
            }
        }
    }
}

#Preview {
    LandingView()
}
