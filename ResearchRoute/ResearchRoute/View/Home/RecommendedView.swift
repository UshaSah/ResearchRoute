//
//  AppliedJobsView.swift
//  Project
//
//  Created by apple on 3/8/24.
//

import SwiftUI

struct RecommendedView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var recommendedViewModel = RecommendedViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SectionTitle("Recommended Jobs")
                
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
                
                CardList(recommendedViewModel.posts) { item in
                    Card(post: ResearchPostModel(title: "Research Position", faculty: ["Sam King"]), appliedDate: nil)
                }
            }
            .padding(30)
            .onAppear {
                recommendedViewModel.getPosts(as: userViewModel)
            }
            .background(backgroundColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    AppliedJobsView()
        .environmentObject(UserViewModel())
}
