//
//  RootView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct RootView: View {
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            if userViewModel.isLoggedIn {
                if userViewModel.doSetup {
                    SetupView()
                }
                else {
                    ProfileView()
                }
            }
            else {
                LandingView()
            }
        }
        .environmentObject(userViewModel)
    }
}

#Preview {
    RootView()
}
