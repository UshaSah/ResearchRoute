import FirebaseFirestore

struct ExperienceModel: ModelMap {
    var title: String
    var organizationName: String
    var description: String
    var startDate: Timestamp
    var endDate: Timestamp
}

struct EducationModel: ModelMap {
    var degree: String
    var university: String
    var startDate: Timestamp
    var endDate: Timestamp
}

struct StudentModel: Model {
    @DocumentID var id: String?
    //var aboutMe: String
    var firstName: String
    var lastName: String
    var majors: [String]?
    var education: [EducationModel]?
    var experience: [ExperienceModel]?
    var coursework: [String]?
    var skills: [String]?
    var keywords: [String]?
}
