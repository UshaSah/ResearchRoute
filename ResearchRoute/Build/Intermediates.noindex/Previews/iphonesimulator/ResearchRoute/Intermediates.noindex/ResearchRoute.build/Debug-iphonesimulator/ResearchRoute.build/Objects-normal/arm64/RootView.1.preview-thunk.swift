@_private(sourceFile: "RootView.swift") import ResearchRoute
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension RootView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/rohan/Documents/WINTER 2024/ResearchRoute/ResearchRoute/ResearchRoute/ResearchRoute/View/RootView.swift", line: 14)
        NavigationView {
            if userViewModel.isLoggedIn {
                if userViewModel.doSetup {
                    SetupView()
                }
                else {
                    HomeView()
                }
            }
            else {
                LandingView()
            }
        }
        .environmentObject(userViewModel)
    
#sourceLocation()
    }
}

import struct ResearchRoute.RootView
#Preview {
    RootView()
}



