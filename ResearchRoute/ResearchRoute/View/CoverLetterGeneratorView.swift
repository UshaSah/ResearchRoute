//
//  CoverLetterGeneratorView.swift
//  Project
//
//  Created by apple on 3/11/24.
//

import SwiftUI
import GoogleGenerativeAI

struct CoverLetterGeneratorView: View {
    @State private var coverLetter: String = ""
    @State private var resume: String = "Name: John Doe, Address: 123 Main St, Sacramento, CA, Email: john.doe@example.com, Phone: (123) 456-7890, Objective: Experienced Software Engineer seeking to leverage proven skills in a challenging role, Skills: Java, Python, C++, SQL, HTML/CSS, JavaScript, Agile/Scrum, Git, Education: B.S. in Computer Science, University of California, Davis, 2016-2020, Experience: Software Engineer, Intel, Sacramento, CA, 2020-Present, Developed and maintained web applications, Collaborated in Agile/Scrum environment, Certifications: Oracle Certified Professional, Java SE 8 Programmer, Languages: English (Native), Spanish (Fluent), Interests: Open-source contribution, Tech blogging."
    
    var body: some View {
        Text("Cover letter: \(coverLetter)")
        Button("Generate Cover Letter") {
            Task {
                coverLetter = await generateCoverLetter()
            }
        }
    }
    
    func generateCoverLetter() async -> String {
        let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

        let prompt = "Generate a cover letter based on the following resume (only include the greeting, body, and signature): \(resume)"
        do {
            let response = try await model.generateContent(prompt)
            if let responseText = response.text {
                return responseText
            }
        } catch {
            print("Error: \(error)")
        }
        return ""
    }
}

#Preview {
    CoverLetterGeneratorView()
}
