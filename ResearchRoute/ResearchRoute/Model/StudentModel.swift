import FirebaseFirestore

struct ExperienceModel: Codable, Hashable {
    var title: String
    var organizationName: String
    var description: String
    var startDate: Timestamp
    var endDate: Timestamp
}

struct StudentModel: Codable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var majors: [String]
    var experience: [ExperienceModel]
    var keywords: [String]
}
