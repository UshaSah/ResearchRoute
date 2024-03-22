import SwiftUI
import WrappingStack

struct EditSkillsView: View {
    @State var course: String = "Java"
    
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
        ZStack {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Edit Skills")
                        .font(.custom(titleFontName, size: titleFontSize))
                        .foregroundStyle(titleColor)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        TextField(course, text: $course, axis: .vertical)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                        
                        Button(action: {
                            print("Skill added")
                        }) {
                            Text("Add skill")
                                .font(.custom(subtitleFontName, size: subtitleFontSize))
                                .padding(.vertical, 5)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundStyle(bodyColor)
                                .background(.white)
                                .overlay(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5, bottomLeading: 5, bottomTrailing: 5, topTrailing: 5)).stroke(bodyColor, lineWidth: 1)) // Create rounded border
                        }
                    }
                    
                    WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 5, verticalSpacing: 5) {
                        ForEach(skillsArray, id: \.self) { skill in
                            HStack {
                                Text(skill)
                                    .font(.custom(bodyFontName, size: bodyFontSize))
                                Button(action: {
                                    print("Skill deleted")
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .font(.custom(bodyFontName, size: bodyFontSize))
                                }
                            }
                            .padding(.vertical, 2)
                            .padding(.horizontal, 10)
                            .foregroundStyle(.white)
                            .background(titleColor)
                            .cornerRadius(5)
                        }
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
        Spacer()
        NavigationMenuView()
            .frame(alignment: .bottom)
    }
}
