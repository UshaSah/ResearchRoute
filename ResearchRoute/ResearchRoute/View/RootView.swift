//
//  RootView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct RootView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            if authViewModel.isLoggedIn {
                HomeView()
                    .environmentObject(authViewModel)
            }
            else {
                LandingView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    RootView()
}
