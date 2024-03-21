import FirebaseFirestore

struct ApplicationModel: Codable {
    @DocumentID var id: String?
    var applicant: DocumentReference
    var post: DocumentReference
}
