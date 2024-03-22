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
        ZStack {
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
    }
}

#Preview {
    RootView()
}
