import FirebaseFirestore
import CodableFirebase

class StudentApi {
    static let collection = "Student"
    
    static func create(data: StudentModel) async throws {
        try await DbApi.create(in: collection, data: data)
    }
    
    static func read() async throws -> StudentModel {
        try await DbApi.read(in: collection, id: AuthApi.getUid())
    }
    
    static func read(id: String) async throws -> StudentModel {
        try await DbApi.read(in: collection, id: id)
    }
    
    static func update(data: StudentModel) async throws {
        try await DbApi.update(in: collection, data: data)
    }
    
    static func deleteStudentAccount(id: String) async throws {
        try await DbApi.delete(in: collection, id: id)
    }
    
    static func deleteStudentAccount(data: StudentModel) async throws {
        try await DbApi.delete(in: collection, data: data)
    }
}
