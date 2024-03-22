//
//  SetupView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/20/24.
//

import SwiftUI

struct SetupView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Do setup / resume parser view")
            
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
    SetupView()
}
