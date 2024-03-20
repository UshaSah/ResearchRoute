// Not to be used directly
import FirebaseAuth

enum AuthApiError: LocalizedError {
    case notLoggedIn
    
    var localizedDescription: String {
        switch self {
            case .notLoggedIn:
                return NSLocalizedString("Not logged in", comment: "")
        }
    }
}

class AuthApi {
    static func create(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    static func login(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    static func logout() async throws {
        try Auth.auth().signOut()
    }
    
    static func getUser() -> User? {
        return Auth.auth().currentUser
    }
    
    static func getUid() -> String? {
        return AuthApi.getUser()?.uid
    }
    
    static func getUid() throws -> String {
        guard let uid = AuthApi.getUid() else {
            throw AuthApiError.notLoggedIn
        }
        return uid
    }
    
    static func isLoggedIn() -> Bool {
        return AuthApi.getUser() != nil
    }
}
