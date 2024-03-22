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
    associatedtype T: Model
}

extension DbApi {
    static func create(data: T) async throws {
        if data.id != nil {
            try await update(data: data)
        }
        else {
            let ref = getCollectionRef()
            try ref.addDocument(from: data)
        }
    }
    
    static func read(ref: DocumentReference) async throws -> Self.T {
        let document = try await ref.getDocument()
        return try document.data(as: T.self)
    }
    
    static func read(refs: [DocumentReference]) async throws -> [Self.T] {
        var data: [T] = []
        
        for ref in refs {
            data.append(try await read(ref: ref))
        }
        
        return data
    }
    
    static func read(id: String) async throws -> Self.T {
        let ref = getDocumentRef(id: id)
        return try await read(ref: ref)
    }
    
    static func read(ids: [String]) async throws -> [Self.T] {
        var data: [T] = []
        
        for id in ids {
            data.append(try await read(id: id))
        }
        
        return data
    }
    
    static func read(filter: @escaping (T) -> Bool) async throws -> [Self.T] {
        let ref = getCollectionRef()
        let snapshot = try await ref.getDocuments()
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
        
        let ref = getDocumentRef(id: id)
        try ref.setData(from: data)
    }
    
    static func delete(data: T) async throws {
        guard let id = getDocumentId(from: data) else {
            throw DbApiError.idNotFound
        }
        
        try await delete(id: id)
    }
    
    static func delete(id: String) async throws {
        let ref = getDocumentRef(id: id)
        try await ref.delete()
    }
    
    static func getDocumentId(from object: T) -> String? {
        return object.id
    }
    
    static func getDocumentRef(id: String) -> DocumentReference {
        let ref = getCollectionRef()
        return ref.document(id)
    }
    
    static func getCollectionRef() -> CollectionReference {
        let db = Firestore.firestore()
        return db.collection(collection)
    }
}
