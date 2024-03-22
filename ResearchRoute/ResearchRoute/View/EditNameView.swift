import SwiftUI

struct EditNameView: View {
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
    
    var body: some View {
        @State var firstName: String = ""
        @State var lastName: String = ""
        
        ZStack {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Edit Name")
                        .font(.custom(titleFontName, size: titleFontSize))
                        .foregroundStyle(titleColor)
                        .multilineTextAlignment(.center)
                    
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
                        Task {
                            do {
                                if var obj = user {
                                    obj.firstName = "Jane"
                                    obj.lastName = "Doe"
                                    try await StudentApi.update(data: obj)
                                }
                            } catch {
                                print("Failed to update user: \(error)")
                            }
                        }
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
        .onAppear {
            Task {
                do {
                    user = try await StudentApi.read(id: AuthApi.getUid())
                } catch {
                    print(error)
                }
            }
        }
        Spacer()
        NavigationMenuView()
            .frame(alignment: .bottom)
    }
    
    func getUser() async {
        do {
            user = try await StudentApi.read(id: AuthApi.getUid())
        } catch {
            print(error)
        }
    }
}
