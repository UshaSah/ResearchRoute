import SwiftUI
import PDFKit
import MobileCoreServices
import GoogleGenerativeAI
import UniformTypeIdentifiers

struct ResumeParserView: View {
    @State private var text: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var experience: String = ""
    @State private var education: String = ""
    @State private var skills: String = ""
    @State private var coursework: String = ""
    @State private var document: PDFDocument? = nil
    @State private var isPickerPresented: Bool = false
    @State private var resumeIsValid: String = ""
    
    // Loading state for each section
    @State private var isLoadingFirstName = false
    @State private var isLoadingExperience = false
    @State private var isLoadingEducation = false
    @State private var isLoadingSkills = false
    @State private var isLoadingCoursework = false
    
    @State var user: StudentModel?
    
    var body: some View {
        
        VStack {
            if isLoadingFirstName {
                ProgressView("Loading first name...")
            } else {
                Text("First name: \(firstName)")
            }
            
            if isLoadingExperience {
                ProgressView("Loading Experience...")
            } else {
                Text("Experience: \(experience)")
            }
            
            if isLoadingEducation {
                ProgressView("Loading Education...")
            } else {
                Text("Education: \(education)")
            }
            
            if isLoadingSkills {
                ProgressView("Loading Skills...")
            } else {
                Text("Skills: \(skills)")
            }
            
            if isLoadingCoursework {
                ProgressView("Loading Coursework...")
            } else {
                Text("Coursework: \(coursework)")
            }
            
            Button(action: {
                self.isPickerPresented = true
            }) {
                Text("Upload PDF")
            }
            .sheet(isPresented: $isPickerPresented) {
                DocumentPicker(document: $document, text: $text, firstName: $firstName, lastName: $lastName, experience: $experience, education: $education, skills: $skills, coursework: $coursework, user: $user, isLoadingName: $isLoadingFirstName, isLoadingExperience: $isLoadingExperience, isLoadingEducation: $isLoadingEducation, isLoadingSkills: $isLoadingSkills, isLoadingCoursework: $isLoadingCoursework, resumeIsValid: $resumeIsValid)
            }
        }
        .onAppear() {
            Task {
                do {
                    user = try await StudentApi.read(id: AuthApi.getUid())
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var document: PDFDocument?
    @Binding var text: String
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var experience: String
    @Binding var education: String
    @Binding var skills: String
    @Binding var coursework: String
    @Binding var user: StudentModel?
    // Bindings for loading states
    @Binding var isLoadingName: Bool
    @Binding var isLoadingExperience: Bool
    @Binding var isLoadingEducation: Bool
    @Binding var isLoadingSkills: Bool
    @Binding var isLoadingCoursework: Bool
    @Binding var resumeIsValid: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.pdf], asCopy: true)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker

        init(_ parent: DocumentPicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            parent.document = PDFDocument(url: url)
            parent.text = extractTextFromPDF(document: parent.document)
            if(parent.text.count < 10) {
                print("Resume too short")
            } else {
                Task {
                    parent.resumeIsValid = await self.checkResumeValidity()
                }
                if(parent.resumeIsValid.lowercased() == "valid resume") {
                    Task {
                        await self.extractAll()
                    }
                } else {
                    print("Resume failed Gemini validity check")
                }
            }
        }

        func extractTextFromPDF(document: PDFDocument?) -> String {
            guard let document = document else { return "" }
            let pageCount = document.pageCount
            var text = ""
            for i in 0..<pageCount {
                guard let page = document.page(at: i) else { continue }
                guard let pageText = page.string else { continue }
                text += pageText
            }
            return text
        }
        
        func checkResumeValidity() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "If the following resume is blank or you do not detect at least one of the following sections: name, experience, education, skills, or coursework, return \"Invalid resume\" (without quotes). Otherwise, return \"Valid resume\" (without quotes). [START RESUME] \(parent.text)"
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
        
        func extractAll() async {
            parent.isLoadingName = true
            parent.firstName = await extractFirstName()
            parent.isLoadingName = false
            
            parent.isLoadingExperience = true
            parent.experience = await extractExperience()
            parent.isLoadingExperience = false
            
            parent.isLoadingEducation = true
            parent.education = await extractEducation()
            parent.isLoadingEducation = false
            
            parent.isLoadingSkills = true
            parent.skills = await extractSkills()
            parent.isLoadingSkills = false
            
            parent.isLoadingCoursework = true
            parent.coursework = await extractCoursework()
            parent.isLoadingCoursework = false
            
            let task = Task {
                await fillFirstName()
            }

            fillSkills()
            fillCoursework()
        }
        
        func extractFirstName() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "Given the following resume, get the first name (e.g. Jane). Return \"error\" (without quotes) if you could not find the full name. [START RESUME] \(parent.text)"
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
        
        func fillFirstName() async {
            let updatedStudent = StudentModel(firstName: parent.firstName, lastName: parent.lastName)
//            let new_name = parent.firstName
            do {
                try await StudentApi.update(data: updatedStudent)
                print("Student's name updated successfully!")
            } catch {
                print("Error updating student's name")
            }
            
        }
       
        
        func extractLastName() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "Given the following resume, get the last name (e.g. Doe). Return \"error\" (without quotes) if you could not find the full name. [START RESUME] \(parent.text)"
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
        
        func extractExperience() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "Given the following resume, write a list of all the experience items in it. Separate the job title, company, description, start date, and end date with a semicolon (DO NOT put a caret or semicolon after the last experience item). Any fields that don't exist should be an empty string. Separate each experience item with a caret. Return \"error\" (without quotes) if you could not find any experience items. For example, your response should look like this: Software Engineer; Google; Worked on Google Cloud team; Aug 2011; Jun 2015^Software Engineer Intern; Amazon; Worked on AWS team; Aug 2008; Jun 2009^ [START RESUME] \(parent.text)"
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
        
        func extractEducation() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "Given the following resume, write a list of all the education items in it. Separate the school, degree, field of study, description, start date, and end date with a semicolon. Any fields that don't exist should be an empty string. Separate each education item with a caret. Return \"error\" (without quotes) if you could not find any education items. For example, your response should look like this: University of California, Davis; Bachelor of Science, Computer Science; Aug 2011; Jun 2015^Harvard University; Master of Science, Computer Science; Aug 2015; Jun 2017^ [START RESUME] \(parent.text)"
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

        func extractSkills() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "Given the following resume, write a list of all the skills with each item being separated by a semicolon and space. Return \"error\" (without quotes) if you could not find any skills. For example, your response should look like this: Microsoft Excel; HTML; CSS; Microsoft Word [START RESUME] \(parent.text)"
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
        
        func fillSkills() {
            print("Skills: \(parent.skills)")
            let newSkills = parent.skills.split(separator: ";").map { String($0.trimmingCharacters(in: .whitespaces)) }
            parent.user?.skills = newSkills
            for skill in parent.user?.skills ?? [] {
                print("Skill: \(skill)")
            }
        }
        
        func extractCoursework() async -> String {
            let apiKey = "AIzaSyA7KtP-leaQgC2MU_4TCSjLELXSRvRjTyQ"
            let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)

            let prompt = "Given the following resume, write a list of all the coursework with each item being separated by a semicolon and space. Return \"error\" (without quotes) if you could not find any quotes. For example, your response should look like this: Introduction to C++; Operating Systems; Web Development; Classical Physics [START RESUME] \(parent.text)"
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
        
        func fillCoursework() {
            print("Coursework: \(parent.coursework)")
            let newCoursework = parent.coursework.split(separator: ";").map { String($0.trimmingCharacters(in: .whitespaces)) }
            parent.user?.coursework = newCoursework
            for course in parent.user?.coursework ?? [] {
                print("Course: \(course)")
            }
        }
        
       

    }
}
