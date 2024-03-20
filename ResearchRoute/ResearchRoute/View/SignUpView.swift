//
//  SignUpView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            TextField("First Name", text: $signUpViewModel.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Last Name", text: $signUpViewModel.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Email", text: $signUpViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $signUpViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                signUpViewModel.signup(with: authViewModel)
            }
            .padding()
            
            Text(authViewModel.errorMessage)
                .foregroundColor(.red)
                .padding()
        }
    }
}

#Preview {
    SignUpView()
}
