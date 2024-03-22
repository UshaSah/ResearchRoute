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
    @State private var searchText = ""
    var body: some View {
        VStack {
            VStack {
                Text("Applied Jobs")
                    .font(.custom(titleFontName, size: titleFontSize))
                    .foregroundStyle(titleColor)
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
                ScrollView {
                    VStack(spacing: 15) {
                        VStack(spacing: 3) {
                            Text("Research Position 1")
                                .font(.custom(titleFontName, size: subtitleFontSize))
                                .foregroundStyle(titleColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(spacing: 3) {
                                Image(systemName: "building")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                                Text("UC Davis - Professor Name")
                                    .font(.custom(bodyFontName, size: bodyFontSize))
                                    .foregroundStyle(bodyColor)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(spacing: 3) {
                                Image(systemName: "location")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                                Text("Davis, CA, USA")
                                    .font(.custom(bodyFontName, size: bodyFontSize))
                                    .foregroundStyle(bodyColor)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Text("$60K/yr")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Applied on 5/1/2023")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(10)
                        .background(.white)
                        .cornerRadius(5)
                        
                        VStack(spacing: 3) {
                            Text("Research Position 2")
                                .font(.custom(titleFontName, size: subtitleFontSize))
                                .foregroundStyle(titleColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(spacing: 3) {
                                Image(systemName: "building")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                                Text("University of Georgia - Professor Name")
                                    .font(.custom(bodyFontName, size: bodyFontSize))
                                    .foregroundStyle(bodyColor)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(spacing: 3) {
                                Image(systemName: "location")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                                Text("Athens, GA, USA")
                                    .font(.custom(bodyFontName, size: bodyFontSize))
                                    .foregroundStyle(bodyColor)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Text("$60K/yr")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Applied on 12/20/2023")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(10)
                        .background(.white)
                        .cornerRadius(5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(30)
        }
        .background(backgroundColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
