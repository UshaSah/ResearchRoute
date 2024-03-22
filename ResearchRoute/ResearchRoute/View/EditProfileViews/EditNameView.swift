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

    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var user: StudentModel? = nil
    @State private var statusMessage: String = ""
    
    var body: some View {
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
                    
                    VStack(alignment: .leading) {
                        Text("First name*")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                        
                        TextField("First name", text: $firstName)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                        Divider()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Last name*")
                            .font(.custom(bodyFontName, size: bodyFontSize))
                            .foregroundStyle(bodyColor)
                        
                        TextField("Last name", text: $lastName)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                        Divider()
                    }
                    
                    Button(action: {
                        Task {
                            await saveName()
                        }
                    }) {
                        Text("Save")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(titleColor)
                            .cornerRadius(5)
                    }

                    Text(statusMessage)
                }
                .padding(30)
            }
        }
        .onAppear {
            Task {
                await getUser()
            }
        }
    }
    
    private func saveName() async {
        guard var updatedUser = user else {
            statusMessage = "User not found"
            return
        }
        
        updatedUser.firstName = firstName
        updatedUser.lastName = lastName
        
        do {
            try await StudentApi.update(data: updatedUser)
            statusMessage = "Your changes have been successfully saved"
            user = updatedUser  // Update local user
        } catch {
            statusMessage = "Error saving changes: \(error.localizedDescription)"
        }
    }

    private func getUser() async {
        do {
            user = try await StudentApi.read(id: AuthApi.getUid())
            firstName = user?.firstName ?? ""
            lastName = user?.lastName ?? ""
        } catch {
            print("Error fetching user: \(error)")
        }
    }
}
