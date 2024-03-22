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
