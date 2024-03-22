//
//  JobApplicationSuccessView.swift
//  ResearchRoute
//
//  Created by apple on 3/21/24.
//

import SwiftUI

struct JobApplicationSuccessView: View {
    let titleFontName: String = "Poppins-Bold"
    let subtitleFontName: String = "Poppins-SemiBold"
    let bodyFontName: String = "Poppins-Regular"

    let titleFontSize: CGFloat = 24
    let subtitleFontSize: CGFloat = 18
    let bodyFontSize: CGFloat = 12

    let titleColor: Color = Color(red: 1/255, green: 159/255, blue: 171/255)
    let subtitleColor: Color = Color(red: 58/255, green: 58/255, blue: 62/255)
    let bodyColor: Color = Color(red: 129/255, green: 136/255, blue: 152/255)
    
    @State private var navigateToRecommendedProjectsView: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(maxWidth: 250, maxHeight: 250)
                .foregroundStyle(titleColor)
            
            Text("Success!")
                .font(.custom(titleFontName, size: titleFontSize))
                .foregroundStyle(titleColor)
            
            Text("Your job application was sent to [PROFESSOR NAME] successfully.")
                .font(.custom(bodyFontName, size: subtitleFontSize))
                .foregroundStyle(bodyColor)
                .multilineTextAlignment(.center)
            
            NavigationLink(destination: RecommendedProjectsView(), isActive: $navigateToRecommendedProjectsView) {
                Button(action: {
                    navigateToRecommendedProjectsView = true
                }, label: {
                    Text("Back to recommended projects")
                })
                .font(.custom(subtitleFontName, size: subtitleFontSize))
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(titleColor)
                .cornerRadius(5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
    }
}

#Preview {
    JobApplicationSuccessView()
}
