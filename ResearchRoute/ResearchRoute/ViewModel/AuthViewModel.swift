import SwiftUI

class AuthViewModel: ViewModel {
    @Published var isLoggedIn = AuthApi.isLoggedIn()
}
