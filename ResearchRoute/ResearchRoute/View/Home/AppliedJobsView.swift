//
//  AppliedJobsView.swift
//  Project
//
//  Created by apple on 3/8/24.
//

import SwiftUI

let titleFontName: String = "Poppins-Bold"
let subtitleFontName: String = "Poppins-SemiBold"
let bodyFontName: String = "Poppins-Regular"

let titleFontSize: CGFloat = 24
let subtitleFontSize: CGFloat = 18
let bodyFontSize: CGFloat = 12

let titleColor: Color = Color(red: 1/255, green: 159/255, blue: 171/255)
let subtitleColor: Color = Color(red: 58/255, green: 58/255, blue: 62/255)
let bodyColor: Color = Color(red: 129/255, green: 136/255, blue: 152/255)
let backgroundColor: Color = Color(red: 249/255, green: 249/255, blue: 254/255)

struct AppliedJobsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var appliedViewModel = AppliedViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            VStack {
                SectionTitle("Applied Jobs")
                
                TextField("", text: $searchText)
                    .font(.custom(bodyFontName, size: bodyFontSize))
                    .foregroundStyle(bodyColor)
                    .padding(10)
                    .padding(.leading, 30)
                    .background(Color.white)
                    .cornerRadius(5)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.medium)
                                .foregroundColor(subtitleColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 10)
                        }
                    )
                
                CardList(appliedViewModel.posts) { item in
                    Card(title: item.title, university: item.university ?? "", faculty: item.faculty.joined(separator: ", "), location: "", pay: item.pay ?? "") {
                        // ??
                    }
                }
            }
            .padding(30)
        }
        .onAppear {
            appliedViewModel.getPosts(as: userViewModel)
        }
        .background(backgroundColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AppliedJobsView()
        .environmentObject(UserViewModel())
}
