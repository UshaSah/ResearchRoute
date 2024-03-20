import SwiftUI

class RootViewModel: ObservableObject {
    @Published var isLoggedIn: Bool?
    
    init() {
        isLoggedIn = nil
    }
}
