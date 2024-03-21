//
//  EditEducationItemView.swift
//  Project
//
//  Created by apple on 2/29/24.
//

/*
 TODO:
- Style date picker
 */

import SwiftUI

struct EditEducationItemView: View {
    @State var school: String = "University of California, Davis"
    @State var degree: String = "Bachelor of Science"
    @State var fieldOfStudy: String = "Computer Science"
    @State var startDate = Date()
    @State var endDate = Date()
    @State var description: String = ""
    
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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Edit Education")
                    .font(.custom(titleFontName, size: titleFontSize))
                    .foregroundStyle(titleColor)
                    .multilineTextAlignment(.center)
                
                Text("* indicates required")
                    .font(.custom(bodyFontName, size: bodyFontSize))
                    .foregroundStyle(bodyColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                VStack {
                    Text("School*")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    TextField(school, text: $school, axis: .vertical)
                        .font(.custom(bodyFontName, size: subtitleFontSize))
                        .foregroundStyle(bodyColor)
                    Divider()
                }
                
                VStack {
                    Text("Degree*")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    TextField(degree, text: $degree, axis: .vertical)
                        .font(.custom(bodyFontName, size: subtitleFontSize))
                        .foregroundStyle(bodyColor)
                    Divider()
                }
                
                VStack {
                    Text("Field of study*")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    TextField(fieldOfStudy, text: $fieldOfStudy, axis: .vertical)
                        .font(.custom(bodyFontName, size: subtitleFontSize))
                        .foregroundStyle(bodyColor)
                    Divider()
                }
                
                VStack {
                    Text("Start date*")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    DatePicker("Select a date", selection: $startDate, displayedComponents: .date)
                        .padding()
                    Divider()
                }
                
                VStack {
                    Text("End date*")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    DatePicker("Select a date", selection: $endDate, displayedComponents: .date)
                        .padding()
                    Divider()
                }
                
                VStack {
                    Text("Description")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    TextField(description, text: $description, axis: .vertical)
                        .font(.custom(bodyFontName, size: subtitleFontSize))
                        .foregroundStyle(bodyColor)
                    Divider()
                }
                
                Button(action: {
                    print("Saved")
                }) {
                    Text("Save")
                        .font(.custom(subtitleFontName, size: subtitleFontSize))
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(.white)
                        .background(titleColor)
                        .cornerRadius(5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(30)
        }
    }
}

#Preview {
    EditEducationItemView()
}
