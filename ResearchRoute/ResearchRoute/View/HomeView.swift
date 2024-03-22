//
//  HomeView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var navigateToProfileView: Bool = false
    
    var body: some View {
        VStack {
            Text("Home")
            NavigationLink(destination: ProfileView(), isActive: $navigateToProfileView) {
                Button(action: {
                    navigateToProfileView = true
                }, label: {
                    Text("Navigate to profile view")
                })
            }
            Button(action: {
                userViewModel.logout()
            }, label: {
                Text("Logout")
            })
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
