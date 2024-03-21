// Not to be used directly

import FirebaseFirestore
import CodableFirebase

enum DbApiError: LocalizedError {
    case idNotFound
    
    var localizedDescription: String {
        switch self {
            case .idNotFound:
                return NSLocalizedString("Document ID not found in collection", comment: "")
        }
    }
}

protocol DbApi {
    static var collection: String { get }
    associatedtype T: Codable
}

extension DbApi {
    static func create(data: T) async throws {
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        try collection.addDocument(from: data)
    }
    
    static func read(ref: DocumentReference) async throws -> Self.T {
        let document = try await ref.getDocument()
        return try document.data(as: T.self)
    }
    
    static func read(id: String) async throws -> Self.T {
        let db = Firestore.firestore()
        let collectionRef = db.collection(collection)
        let ref = collectionRef.document(id)
        return try await read(ref: ref)
    }
    
    static func read(filter: @escaping (T) -> Bool) async throws -> [Self.T] {
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
    
    static func update(data: T) async throws {
        guard let id = getDocumentId(from: data) else {
            throw DbApiError.idNotFound
        }
        
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        let ref = collection.document(id)
        try ref.setData(from: data)
    }
    
    static func delete(data: T) async throws {
        guard let id = getDocumentId(from: data) else {
            throw DbApiError.idNotFound
        }
        
        try await delete(id: id)
    }
    
    static func delete(id: String) async throws {
        let db = Firestore.firestore()
        let collection = db.collection(collection)
        let ref = collection.document(id)
        try await ref.delete()
    }
    
    static func getDocumentId(from object: T) -> String? {
        let mirror = Mirror(reflecting: object)
        for case let (label?, value) in mirror.children {
            if label.hasPrefix("_"), label.hasSuffix("id") {
                return value as? String
            }
        }
        return nil
    }
}
