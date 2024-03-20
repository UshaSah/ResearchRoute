//
//  RootView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
    
    var body: some View {
        NavigationStack {
            if let isLoggedIn = viewModel.isLoggedIn {
                if isLoggedIn {
                    HomeView()
                }
                else {
                    LoginView()
                }
            }
            else {
                SplashView()
            }
        }
    }
}

#Preview {
    RootView()
}
