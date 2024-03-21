import SwiftUI
import WrappingStack

struct ProfileView: View {
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
    
    @State var user: StudentModel? = nil
    
    @State private var navigateToEditNameAndPictureView = false
    @State private var navigateToEditAboutMeView = false
    @State private var navigateToEditExperienceItemView = false
    @State private var navigateToEditEducationItemView = false
    @State private var navigateToEditSkillsView = false
    @State private var navigateToEditCourseworkView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                VStack(spacing: 3) {
                    Image(systemName: "person")
                        .font(.system(size: 90))
                    
                    HStack(spacing: 3) {
                        Text((user?.firstName ?? "nil") + " " + (user?.lastName ?? "nil"))
                            .font(.custom(titleFontName, size: titleFontSize))
                            .foregroundStyle(titleColor)
                        
                        Button(action: {
                            print("Edit button tapped!")
                            navigateToEditNameAndPictureView = true
                        }) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.medium)
                                .foregroundStyle(titleColor)
                        }
                        .navigationDestination(isPresented: $navigateToEditNameAndPictureView) {
                            EditNameAndPictureView()
                        }
                    }
                    ResumeParserView()
                    CoverLetterGeneratorView()
                }
                
                VStack(spacing: 3) {
                    HStack(spacing: 3) {
                        Text("About Me")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                        
                        Button(action: {
                            print("Edit button tapped!")
                            navigateToEditAboutMeView = true
                        }) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.medium)
                                .foregroundStyle(titleColor)
                        }
                        .navigationDestination(isPresented: $navigateToEditAboutMeView) {
                            EditAboutMeView()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .foregroundStyle(bodyColor)
                }
                
                VStack(spacing: 3) {
                    Text("Experience")
                        .font(.custom(subtitleFontName, size: subtitleFontSize))
                        .foregroundStyle(subtitleColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack() {
                        HStack(spacing: 3) {
                            Text("Senior Software Engineer")
                                .font(.custom(subtitleFontName, size: 14))
                                .foregroundStyle(bodyColor)
                            
                            Button(action: {
                                print("Edit button tapped!")
                                navigateToEditExperienceItemView = true
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                            }
                            .navigationDestination(isPresented: $navigateToEditExperienceItemView) {
                                EditExperienceItemView()
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Google")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Aug 2021 - Present")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                VStack(spacing: 3) {
                    Text("Education")
                        .font(.custom(subtitleFontName, size: subtitleFontSize))
                        .foregroundStyle(subtitleColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack() {
                        HStack(spacing: 3) {
                            Text("University of California, Davis")
                                .font(.custom(subtitleFontName, size: 14))
                                .foregroundStyle(bodyColor)
                            
                            Button(action: {
                                print("Edit button tapped!")
                                navigateToEditEducationItemView = true
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                            }
                            .navigationDestination(isPresented: $navigateToEditEducationItemView) {
                                EditEducationItemView()
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Bachelor of Science, Computer Science")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Aug 2011 - Jun 2015")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                VStack(spacing: 3) {
                    HStack(spacing: 3) {
                        Text("Skills")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                        
                        Button(action: {
                            print("Edit button tapped!")
                            navigateToEditSkillsView = true
                        }) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.medium)
                                .foregroundStyle(titleColor)
                        }
                        .navigationDestination(isPresented: $navigateToEditSkillsView) {
                            EditSkillsView()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 5, verticalSpacing: 5) {
                        ForEach(skillsArray, id: \.self) { skill in
                            Text(skill)
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .padding(.vertical, 2)
                                .padding(.horizontal, 10)
                                .foregroundStyle(.white)
                                .background(titleColor)
                                .cornerRadius(5)
                        }
                    }
                }
                VStack(spacing: 3) {
                    HStack(spacing: 3) {
                        Text("Courses")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                        
                        Button(action: {
                            print("Edit button tapped!")
                            navigateToEditCourseworkView = true
                        }) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.medium)
                                .foregroundStyle(titleColor)
                        }
                        .navigationDestination(isPresented: $navigateToEditCourseworkView) {
                            EditCourseworkView()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 5, verticalSpacing: 5) {
                        ForEach(coursesArray, id: \.self) { course in
                            Text(course)
                                .font(.custom(bodyFontName, size: bodyFontSize))
                                .padding(.vertical, 2)
                                .padding(.horizontal, 10)
                                .foregroundStyle(.white)
                                .background(titleColor)
                                .cornerRadius(5)
                        }
                    }
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(30)
        }
    }
}
