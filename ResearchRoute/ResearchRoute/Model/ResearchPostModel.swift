import FirebaseFirestore

struct ResearchPostModel: Model {
    @DocumentID var id: String?
    var title: String
    var faculty: [String]
    var university: String?
    var location: String?
    var pay: String?
    var description: String?
    var responsibilities: [String]?
    var requirements: [String]?
    var department: String?
    var keywords: [String]?
}
