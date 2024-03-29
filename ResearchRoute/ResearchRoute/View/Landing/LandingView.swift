import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
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
}

#Preview {
    LandingView()
}
