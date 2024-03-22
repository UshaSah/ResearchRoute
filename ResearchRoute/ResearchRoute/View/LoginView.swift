//
//  LoginView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var loginViewModel = LoginInfo()
    @State private var navigateToProfileView: Bool = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $loginViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
            
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                userViewModel.login(with: loginViewModel)
                navigateToProfileView = true
            }) {
                Text("Login")
            }
            .navigationDestination(isPresented: $navigateToProfileView) {
                ProfileView()
            }
            
            Text(userViewModel.errorMessage)
                .foregroundColor(.red)
                .padding()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(UserViewModel())
}
