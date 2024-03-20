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
            
            Button("Login") {
                userViewModel.login(with: loginViewModel)
            }
            .padding()
            
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
