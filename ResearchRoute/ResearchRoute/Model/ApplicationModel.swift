import FirebaseFirestore

struct ApplicationModel: Model {
    @DocumentID var id: String?
    var applicant: DocumentReference
    var post: DocumentReference
}
