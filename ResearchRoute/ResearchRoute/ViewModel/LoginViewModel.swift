import SwiftUI

class LoginViewModel: ViewModel {
    @Published var email = ""
    @Published var password = ""
    
    func login(with authViewModel: AuthViewModel) {
        doTask {
            try await AuthApi.login(email: self.email, password: self.password)
        } callback: {
            authViewModel.isLoggedIn = true
        }
    }
}
