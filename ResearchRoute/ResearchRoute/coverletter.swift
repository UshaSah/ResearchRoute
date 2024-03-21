//
//  coverletter.swift
//  ResearchRoute
//
//  Created by Rohan Malige on 3/20/24.
//

import Foundation
import SwiftUI
import GoogleGenerativeAI
import FirebaseFirestore

struct CoverLetterGeneratorView: View {
    @State private var coverLetter: String = ""
    var student: StudentModel
    
    var body: some View {
        VStack {
            Text("Cover letter: \(coverLetter)")
            Button("Generate Cover Letter") {
                Task {
                    coverLetter = await generateCoverLetter(for: student)
                }
            }
        }
    }
    
    func generateCoverLetter(for student: StudentModel) async -> String {
        let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        
        // Construct a detailed resume string from StudentModel
        let resume = constructResumeString(from: student)
        
        let prompt = "Generate a professional cover letter for a research job based on the following resume (include a greeting, body, and signature): \(resume)"
        
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
    
    func constructResumeString(from student: StudentModel) -> String {
        let fullName = "\(student.firstName) \(student.lastName)"
        let majors = student.majors?.joined(separator: ", ") ?? "N/A"
        let experiences = student.experience?.map { exp -> String in
            let startDate = DateFormatter.localizedString(from: exp.startDate.dateValue(), dateStyle: .short, timeStyle: .none)
            let endDate = DateFormatter.localizedString(from: exp.endDate.dateValue(), dateStyle: .short, timeStyle: .none)
            return "\(exp.title) at \(exp.organizationName), \(startDate) to \(endDate): \(exp.description)"
        }.joined(separator: ", ")
        
        let keywords = student.keywords?.joined(separator: ", ") ?? "N/A"
        
        return "Name: \(fullName), Majors: \(majors), Experience: \(experiences ?? "N/A"), Skills and Interests: \(keywords)"
    }
}

//// Example instantiation of StudentModel and ExperienceModel
//let experienceSample = ExperienceModel(title: "Research Assistant", organizationName: "University Laboratory", description: "Conducted experiments and contributed to research on neural networks.", startDate: Timestamp(date: Date()), endDate: Timestamp(date: Date()))
//let studentSample = StudentModel(id: "1", firstName: "John", lastName: "Doe", majors: ["Computer Science"], experience: [experienceSample], keywords: ["Machine Learning", "Data Analysis", "Neural Networks"])
//
//// Previewing with a sample student
//struct PreviewWrapper: View {
//    var body: some View {
//        CoverLetterGeneratorView(student: studentSample)
//    }
//}
