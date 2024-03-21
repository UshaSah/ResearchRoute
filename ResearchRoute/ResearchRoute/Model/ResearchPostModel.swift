import FirebaseFirestore

struct ResearchPostModel: Codable {
    @DocumentID var id: String?
    var title: String
    var faculty: [String]
    var university: String?
    var description: String?
    var responsibilities: [String]?
    var requirements: [String]?
    var department: String?
    var keywords: [String]?
}
