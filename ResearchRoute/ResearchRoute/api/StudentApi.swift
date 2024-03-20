import FirebaseFirestore
import CodableFirebase

class StudentApi {
    static func create(data: StudentModel) async throws {
        try await DbApi.create(in: "Student", data: data)
    }
    
    static func read(id: String) async throws -> StudentModel {
        return try await DbApi.read(in: "Student", id: id)
    }
    
    static func update(data: StudentModel) async throws {
        return try await DbApi.update(in: "Student", data: data)
    }
    
    static func delete(id: String) async throws {
        return try await DbApi.delete(in: "Student", id: id)
    }
    
    static func delete(data: StudentModel) async throws {
        return try await DbApi.delete(in: "Student", data: data)
    }
}
