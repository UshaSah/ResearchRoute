import SwiftUI

enum CurrentNavigationView {
    case profile
    case recommendedProjects
    case appliedProjects
    case ocr
}

class NavigationViewModel: ObservableObject {
    @Published var current = CurrentNavigationView.profile
}
