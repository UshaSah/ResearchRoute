import FirebaseFirestore
import CodableFirebase

enum DbApiError: LocalizedError {
    case idNotFound
    
    var localizedDescription: String {
        switch self {
            case .idNotFound:
                return NSLocalizedString("Document ID not found in type T", comment: "")
        }
    }
}

class DbApi {
    static func create(in collection: String, data: Encodable) async throws {
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        try collection.addDocument(from: data)
    }
    
    static func read<T: Decodable>(in collection: String, id: String) async throws -> T {
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        let ref = collection.document(id)
        let document = try await ref.getDocument()
        return try document.data(as: T.self)
    }
    
    static func read<T: Decodable>(in collection: String, filter: @escaping (T) -> Bool) async throws -> [T] {
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        let snapshot = try await collection.getDocuments()
        var result: [T] = []
        
        for document in snapshot.documents {
            if let data = try? document.data(as: T.self), filter(data) {
                result.append(data)
            }
        }
        
        return result
    }
    
    static func update<T: Encodable>(in collection: String, data: T) async throws {
        guard let id = getDocumentId(from: data) else {
            throw DbApiError.idNotFound
        }
        
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        let ref = collection.document(id)
        try ref.setData(from: data)
    }
    
    static func delete(in collection: String, data: Any) async throws {
        guard let id = getDocumentId(from: data) else {
            throw DbApiError.idNotFound
        }
        
        try await DbApi.delete(in: collection, id: id)
    }
    
    static func delete(in collection: String, id: String) async throws {
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        let ref = collection.document(id)
        try await ref.delete()
    }
    
    static func getDocumentId(from object: Any) -> String? {
        let mirror = Mirror(reflecting: object)
        for case let (label?, value) in mirror.children {
            if label.hasPrefix("_"), label.hasSuffix("id") {
                return value as? String
            }
        }
        return nil
    }
}
