import SwiftUI

class SignUpViewModel: ViewModel {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    func signup(with authViewModel: AuthViewModel) {
        doTask {
            try await AuthApi.create(email: self.email, password: self.password)
            try await StudentApi.create(data: StudentModel(
                id: AuthApi.getUid(),
                firstName: self.firstName,
                lastName: self.lastName
            ))
        } callback: {
            authViewModel.isLoggedIn = true
        }
    }
}
