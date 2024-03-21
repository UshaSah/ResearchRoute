import SwiftUI

class UserViewModel: ViewModel {
    @Published var isLoggedIn = AuthApi.isLoggedIn()
    @Published var doSetup = false
    @Published var studentData: StudentModel?
    
    func createStudentAccount(with signUpInfo: SignUpInfo) {
        doTask {
            try await AuthApi.create(email: signUpInfo.email, password: signUpInfo.password)
            let studentData = StudentModel(
                id: AuthApi.getUid(),
                firstName: signUpInfo.firstName,
                lastName: signUpInfo.lastName
            )
            try await StudentApi.create(data: studentData)
            return studentData
        } callback: { studentData in
            self.studentData = studentData
            self.isLoggedIn = true
            self.doSetup = true
        }
    }
    
    func login(with loginViewModel: LoginInfo) {
        doTask {
            try await AuthApi.login(email: loginViewModel.email, password: loginViewModel.password)
        } callback: {
            self.isLoggedIn = true
        }
    }
    
    func logout() {
        doTask {
            try await AuthApi.logout()
        } callback: {
            self.isLoggedIn = false
        }
    }
}