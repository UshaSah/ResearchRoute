//
//  HomeView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Home")
            
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
