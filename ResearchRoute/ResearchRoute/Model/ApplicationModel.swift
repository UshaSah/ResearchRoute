import FirebaseFirestore

struct ApplicationModel: Codable {
    @DocumentID var id: String?
    var applicant: DocumentReference
    var post: DocumentReference
    
     func getApplicant() async throws -> StudentModel {
         return try await StudentApi.read(ref: applicant)
     }
     
     func getPost() async throws -> ResearchPostModel {
         return try await ResearchPostApi.read(ref: post)
     }
}
