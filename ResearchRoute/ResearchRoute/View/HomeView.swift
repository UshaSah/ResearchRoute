//
//  HomeView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var navigationViewModel = NavigationViewModel()
    
    var body: some View {
        VStack {
            if navigationViewModel.current == .profile {
                ProfileView()
            }
            else if navigationViewModel.current == .appliedProjects {
                // ??
            }
            else if navigationViewModel.current == .recommendedProjects {
                // ??
            }
            else if navigationViewModel.current == .ocr {
                // ??
            }
            
            Spacer()
            
            NavigationMenuView()
                .frame(alignment: .bottom)
        }
        .environmentObject(navigationViewModel)
    }
}

#Preview {
    HomeView()
}
