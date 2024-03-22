import SwiftUI

enum CurrentNavigationView {
    case profile
    case recommendedProjects
    case appliedProjects
    case ocr
}

class NavigationViewModel: ViewModel {
    @Published var current = CurrentNavigationView.profile
}
