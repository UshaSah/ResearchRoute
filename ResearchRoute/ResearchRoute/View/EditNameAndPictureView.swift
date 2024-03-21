import SwiftUI

struct EditNameAndPictureView: View {
    @State var firstName: String = "Jane"
    @State var lastName: String = "Doe"
    
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
                    Text("Edit Name and Picture")
                        .font(.custom(titleFontName, size: titleFontSize))
                        .foregroundStyle(titleColor)
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 3) {
                        Image(systemName: "person")
                            .font(.system(size: 90))
                        
                        Button(action: {
                            print("Edit image pressed")
                        }) {
                            Text("Edit image")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                        }
                    }
                    
                    Text("* indicates required")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    VStack {
                        Text("First name*")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                        TextField(firstName, text: $firstName, axis: .vertical)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                        Divider()
                    }
                    
                    VStack {
                        Text("Last name*")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                        TextField(lastName, text: $lastName, axis: .vertical)
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
        Spacer()
        NavigationMenuView()
            .frame(alignment: .bottom)
    }
}

