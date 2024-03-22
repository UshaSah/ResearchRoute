import SwiftUI
import GoogleGenerativeAI

struct ApplicationView: View {
    @State private var navigateToJobApplicationSuccessView: Bool = false

    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var education: String = ""
    @State private var coverLetter: String = ""
    @State private var isLoading: Bool = false
    @State private var resume: String = "Name: John Doe, Address: 123 Main St, Sacramento, CA, Email: john.doe@example.com, Phone: (123) 456-7890, Objective: Experienced Software Engineer seeking to leverage proven skills in a challenging role, Skills: Java, Python, C++, SQL, HTML/CSS, JavaScript, Agile/Scrum, Git, Education: B.S. in Computer Science, University of California, Davis, 2016-2020, Experience: Software Engineer, Intel, Sacramento, CA, 2020-Present, Developed and maintained web applications"
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Apply to [JOB TITLE]") // ?
                        .font(.custom(titleFontName, size: titleFontSize))
                        .foregroundStyle(titleColor)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        Text("Your profile details will be sent to the employer.")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .foregroundStyle(subtitleColor)
                        Text("Name: Jane Doe") // ??
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                        Text("Cover letter: \(isLoading ? "Generating cover letter..." : coverLetter)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(.custom(bodyFontName, size: subtitleFontSize))
                            .foregroundStyle(bodyColor)
                    }
                    
                    Button(action: {
                        Task {
                            isLoading = true
                            coverLetter = await generateCoverLetter()
                            isLoading = false
                        }
                    }) {
                        Text("Generate cover letter")
                            .font(.custom(subtitleFontName, size: subtitleFontSize))
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .overlay(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5, bottomLeading: 5, bottomTrailing: 5, topTrailing: 5)).stroke(titleColor, lineWidth: 2))
                            .foregroundStyle(titleColor)
                            .background(.white)
                            .cornerRadius(5)
                    }
                    
                    NavigationLink(destination: JobApplicationSuccessView(), isActive: $navigateToJobApplicationSuccessView) {
                        Button(action: {
                            navigateToJobApplicationSuccessView = true
                        }, label: {
                            Text("Apply")
                        })
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
    
    func generateCoverLetter() async -> String {
        let resume = "Name: \(firstName) \(lastName), Education: \(education)"
        // Include other details as necessary
        
        let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ" // Use your actual API key
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        let prompt = "Generate a cover letter based on the following resume (only include the greeting, body, and signature). My name is INSERT NAME HERE. The professor's name is PROFESSOR NAME. [START RESUME]\(resume)" // Replace "INSERT NAME HERE" with the name of the person applying and replace "PROFESSOR NAME" with the professor who is hiring for the position
        
        do {
            let response = try await model.generateContent(prompt)
            if let responseText = response.text {
                return responseText
            }
        } catch {
            print("Error: \(error)")
        }
        return "Unable to generate cover letter at this time."
    }
}

#Preview {
    ApplicationView()
}
