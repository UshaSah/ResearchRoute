//
//  NavigationMenuView.swift
//  Project
//
//  Created by apple on 3/13/24.
//

import SwiftUI

struct NavigationMenuView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    
    let titleFontName: String = "Poppins-Bold"
    let subtitleFontName: String = "Poppins-SemiBold"
    let bodyFontName: String = "Poppins-Regular"

    let titleFontSize: CGFloat = 24
    let subtitleFontSize: CGFloat = 18
    let bodyFontSize: CGFloat = 10
    
    let titleColor: Color = Color(red: 1/255, green: 159/255, blue: 171/255)
    let subtitleColor: Color = Color(red: 58/255, green: 58/255, blue: 62/255)
    let bodyColor: Color = Color(red: 129/255, green: 136/255, blue: 152/255)
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                navigationViewModel.current = .profile
            }) {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                    Text("Profile")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom(bodyFontName, size: bodyFontSize))
                }
                .foregroundStyle(bodyColor)
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                navigationViewModel.current = .recommendedProjects
            }) {
                VStack {
                    Image(systemName: "briefcase")
                        .imageScale(.large)
                    Text("Recommended Projects")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom(bodyFontName, size: bodyFontSize))
                }
                .foregroundStyle(bodyColor)
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                navigationViewModel.current = .appliedProjects
            }) {
                VStack {
                    Image(systemName: "archivebox")
                        .imageScale(.large)
                    Text("Applied Jobs")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom(bodyFontName, size: bodyFontSize))
                }
                .foregroundStyle(bodyColor)
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                navigationViewModel.current = .ocr
            }) {
                VStack {
                    Image(systemName: "doc.viewfinder")
                        .imageScale(.large)
                    Text("Scan Nameplate")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom(bodyFontName, size: bodyFontSize))
                }
                .foregroundStyle(bodyColor)
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
}
