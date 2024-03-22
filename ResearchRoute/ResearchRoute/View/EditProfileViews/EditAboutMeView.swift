import SwiftUI

struct EditAboutMeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var text: String = ""
    @State private var statusMessage: String = ""

    // Font and style settings
    let titleFontName: String = "Poppins-Bold"
    let bodyFontName: String = "Poppins-Regular"

    let titleFontSize: CGFloat = 24
    let bodyFontSize: CGFloat = 18

    let titleColor: Color = Color(red: 1/255, green: 159/255, blue: 171/255)
    let bodyColor: Color = Color(red: 129/255, green: 136/255, blue: 152/255)

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Edit About Me")
                        .font(.custom(titleFontName, size: titleFontSize))
                        .foregroundStyle(titleColor)
                        .multilineTextAlignment(.center)

                    TextField("About Me", text: $text)
                        .font(.custom(bodyFontName, size: bodyFontSize))
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)

                    Button(action: {
                        Task {
                            await saveAboutMe()
                        }
                    }) {
                        Text("Save")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .padding()
                            .background(titleColor)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }

                    Text(statusMessage)
                }
                .padding()
            }
        }
        .onAppear {
            if let aboutMe = userViewModel.studentData?.aboutMe {
                text = aboutMe
            }
        }
    }

    private func saveAboutMe() async {
        guard var updatedUser = userViewModel.studentData else {
            statusMessage = "User not found"
            return
        }
        
        print(updatedUser.id ?? "None")
        updatedUser.aboutMe = text

        do {
            try await StudentApi.update(data: updatedUser)
            statusMessage = "Your changes have been successfully saved"
            userViewModel.studentData?.aboutMe = text  // Update local view model
        } catch {
            statusMessage = "Error saving changes: \(error.localizedDescription)"
        }
    }
}
