import SwiftUI
import WrappingStack

struct ResearchPostView: View {
    init() {
        for familyName in UIFont.familyNames {
            print(familyName) // Prints font family name
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)") // Prints all font names
            }
        }
    }
    
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
    
    @State private var navigateToApplicationView = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 15) {
                    VStack(spacing: 3) {
                        Text("Artificial Intelligence Researcher")
                            .font(.custom(titleFontName, size: titleFontSize))
                            .foregroundStyle(titleColor)
                            .multilineTextAlignment(.center)
                        
                        Text("Jane Doe")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                        
                        Text("University of California, Davis")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                    }
                    
                    VStack(spacing: 3) {
                        Text("Summary")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                    }
                    
                    VStack(spacing: 3) {
                        Text("Responsibilities")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack() {
                            Text("• Responsibility 1")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Responsibility 2")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Responsibility 3")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Responsibility 4")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Responsibility 5")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Responsibility 6")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    VStack(spacing: 3) {
                        Text("Requirements")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack() {
                            Text("• Requirement 1")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Requirement 2")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Requirement 3")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Requirement 4")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Requirement 5")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("• Requirement 6")
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .foregroundStyle(bodyColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    HStack(spacing: 30) {
                        Button(action: {
                            print("Left chevron tapped!")
                        }) {
                            Image(systemName: "chevron.backward")
                                .font(.custom(subtitleFontName, size: subtitleFontSize))
                                .fontWeight(.bold)
                                .foregroundStyle(titleColor)
                        }
                        
                        Button(action: {
                            print("Apply button tapped!")
                            navigateToApplicationView = true
                        }) {
                            Text("Apply")
                                .font(.custom(subtitleFontName, size: subtitleFontSize))
                                .padding(.vertical, 5)
                                .padding(.horizontal, 15)
                                .foregroundStyle(.white)
                                .background(titleColor)
                                .cornerRadius(5)
                        }
                        .navigationDestination(isPresented: $navigateToApplicationView) {
                            ApplicationView()
                        }
                        
                        Button(action: {
                            print("Right chevron tapped!")
                        }) {
                            Image(systemName: "chevron.forward")
                                .font(.custom(subtitleFontName, size: subtitleFontSize))
                                .fontWeight(.bold)
                                .foregroundStyle(titleColor)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
            }
        }
    }
}
