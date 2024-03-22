//
//  EditAboutMeView.swift
//  Project
//
//  Created by apple on 2/29/24.
//

import SwiftUI

struct EditAboutMeView: View {
    @State var text: String = "Existing text here"
    @State var user: StudentModel? = nil
    
    let titleFontName: String = "Poppins-Bold"
    let subtitleFontName: String = "Poppins-SemiBold"
    let bodyFontName: String = "Poppins-Regular"

    let titleFontSize: CGFloat = 24
    let subtitleFontSize: CGFloat = 18
    let bodyFontSize: CGFloat = 12

    let titleColor: Color = Color(red: 1/255, green: 159/255, blue: 171/255)
    let subtitleColor: Color = Color(red: 58/255, green: 58/255, blue: 62/255)
    let bodyColor: Color = Color(red: 129/255, green: 136/255, blue: 152/255)

    let skillsArray = ["HTML", "CSS", "JavaScript", "React.js", "MongoDB", "Swift", "Angular.js", "Python"]
    let coursesArray = ["Data Structures and Algorithms", "Operating Systems", "Artificial Intelligence", "Computer Vision", "iOS App Development"]
    
    @State private var statusMessage: String = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Edit About Me")
                        .font(.custom(titleFontName, size: titleFontSize))
                        .foregroundStyle(titleColor)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        TextField(text, text: $text, axis: .vertical)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                        Divider()
                    }
                    
                    Button(action: {
                        print("Saved")
                        statusMessage = "Your changes have been successfully saved"
                    }) {
                        Text("Save")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.white)
                            .background(titleColor)
                            .cornerRadius(5)
                    }
                    
                    Text(statusMessage)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
            }
        }
        .onAppear {
            Task {
                do {
                    user = try await StudentApi.read(id: AuthApi.getUid())
                } catch {
                    print(error)
                }
            }
            if user == nil {
                print("Could not fetch user")
            }
        }
        Spacer()
        NavigationMenuView()
            .frame(alignment: .bottom)
    }
}
