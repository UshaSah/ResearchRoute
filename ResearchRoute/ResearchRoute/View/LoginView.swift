//
//  LoginView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $loginViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                loginViewModel.login(with: authViewModel)
            }
            .padding()
            
            Text(authViewModel.errorMessage)
                .foregroundColor(.red)
                .padding()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
