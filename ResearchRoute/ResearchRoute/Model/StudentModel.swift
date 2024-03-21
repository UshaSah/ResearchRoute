import FirebaseFirestore

struct ExperienceModel: Codable, Hashable {
    var title: String
    var organizationName: String
    var description: String
    var startDate: Timestamp
    var endDate: Timestamp
}

struct EducationModel: Codable, Hashable {
    var degree: String
    var university: String
    var startDate: Timestamp
    var endDate: Timestamp
}

struct StudentModel: Codable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var majors: [String]?
    var education: [EducationModel]?
    var experience: [ExperienceModel]?
    var coursework: [String]?
    var skills: [String]?
    var keywords: [String]?
}
