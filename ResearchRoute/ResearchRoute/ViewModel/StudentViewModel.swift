import SwiftUI

// ViewModel to handle updating StudentModel
class StudentViewModel: ObservableObject {
    @Published var student: StudentModel
    
    init(student: StudentModel) {
        self.student = student
    }
    
    // Method to update ID
    func updateID(_ newID: String?) {
        student.id = newID
    }
    
    // Method to update first name
    func updateFirstName(_ newName: String) {
        student.firstName = newName
    }
    
    // Method to update last name
    func updateLastName(_ newName: String) {
        student.lastName = newName
    }
    
    // Method to update majors
    func updateMajors(_ newMajors: [String]?) {
        student.majors = newMajors
    }
    
    // Method to update education
    func updateEducation(_ newEducation: [EducationModel]?) {
        student.education = newEducation
    }
    
    // Method to update experience
    func updateExperience(_ newExperience: [ExperienceModel]?) {
        student.experience = newExperience
    }
    
    // Method to update coursework
    func updateCoursework(_ newCoursework: [String]?) {
        student.coursework = newCoursework
    }
    
    // Method to update skills
    func updateSkills(_ newSkills: [String]?) {
        student.skills = newSkills
    }
    
    // Method to update keywords
    func updateKeywords(_ newKeywords: [String]?) {
        student.keywords = newKeywords
    }
}

// View to update student's attributes
struct UpdateStudentView: View {
    @ObservedObject var viewModel: StudentViewModel
    
    var body: some View {
        VStack {
            TextField("ID", text: $viewModel.student.id ?? "")
            TextField("First Name", text: $viewModel.student.firstName)
            TextField("Last Name", text: $viewModel.student.lastName)
            // Add more fields to update other attributes...
            
            Button("Update") {
                // Call appropriate methods in ViewModel to update attributes
                viewModel.updateID(viewModel.student.id)
                viewModel.updateFirstName(viewModel.student.firstName)
                viewModel.updateLastName(viewModel.student.lastName)
                // Call more update methods as needed...
            }
        }
    }
}

// Example usage
struct ContentView: View {
    @StateObject var studentViewModel = StudentViewModel(student: StudentModel(firstName: "John", lastName: "Doe", majors: ["Computer Science"]))
    
    var body: some View {
        UpdateStudentView(viewModel: studentViewModel)
    }
}
