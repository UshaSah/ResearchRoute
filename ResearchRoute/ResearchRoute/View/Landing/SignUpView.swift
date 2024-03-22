//
//  SignUpView.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/19/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var signUpViewModel = SignUpInfo()
    
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
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
            
            SecureField("Password", text: $signUpViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                userViewModel.createStudentAccount(with: signUpViewModel)
            }
            .padding()
            
            Text(userViewModel.errorMessage)
                .foregroundColor(.red)
                .padding()
        }
    }
}

#Preview {
    SignUpView()
}
