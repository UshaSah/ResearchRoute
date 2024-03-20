import FirebaseFirestore

struct ResearchPostModel: Codable {
    @DocumentID var id: String?
    var title: String
    var faculty: [String]
    var description: String?
    var department: String?
    var keywords: [String]?
}
