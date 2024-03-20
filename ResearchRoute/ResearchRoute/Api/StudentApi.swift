import FirebaseFirestore
import CodableFirebase

class StudentApi {
    static func create(data: StudentModel) async throws {
        try await DbApi.create(in: "Student", data: data)
    }
    
    static func read() async throws -> StudentModel {
        try await DbApi.read(in: "Student", id: AuthApi.getUid())
    }
    
    static func read(id: String) async throws -> StudentModel {
        try await DbApi.read(in: "Student", id: id)
    }
    
    static func update(data: StudentModel) async throws {
        try await DbApi.update(in: "Student", data: data)
    }
    
    static func deleteStudentAccount(id: String) async throws {
        try await DbApi.delete(in: "Student", id: id)
    }
    
    static func deleteStudentAccount(data: StudentModel) async throws {
        try await DbApi.delete(in: "Student", data: data)
    }
}
