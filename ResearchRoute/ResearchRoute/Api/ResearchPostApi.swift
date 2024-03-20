class ResearchPostApi {
    static let collection = "ResearchPost"
    
    static func create(data: ResearchPostModel) async throws {
        try await DbApi.create(in: collection, data: data)
    }
    
    static func read(id: String) async throws -> ResearchPostModel {
        return try await DbApi.read<ResearchPostModel>(in: collection, id: id)
    }
    
    static func read(keywords: [String]) async throws -> [ResearchPostModel] {
        let keywords = Set(keywords)
        return try await DbApi.read<ResearchPostModel>(in: collection) { data in
            return !keywords.intersection(data.keywords ?? []).isEmpty
        }
    }
    
    static func update(data: ResearchPostModel) async throws {
        try await DbApi.update(in: collection, data: data)
    }
    
    static func delete(id: String) async throws {
        try await DbApi.delete(in: collection, id: id)
    }
    
    static func delete(data: ResearchPostModel) async throws {
        try await DbApi.delete(in: collection, data: data)
    }
}
