import FirebaseFirestore

class ResearchPostApi: DbApi {
    typealias T = ResearchPostModel
    static let collection = "ResearchPost"
    
    static func read(keywords: [String]) async throws -> [ResearchPostModel] {
        let toLower: ([String]) -> [String] = { words in
            return words.map { word in
                return word.lowercased()
            }
        }
        
        let keywords = Set(toLower(keywords))
        
        return try await read { data in
            let other = toLower(data.keywords ?? [])
            return !keywords.intersection(other).isEmpty
        }
    }
}
