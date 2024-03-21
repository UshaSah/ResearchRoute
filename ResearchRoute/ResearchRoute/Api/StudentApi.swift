import FirebaseFirestore

class StudentApi : DbApi {
    typealias T = StudentModel
    static let collection = "Student"
}
