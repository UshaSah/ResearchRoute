import FirebaseFirestore

typealias ModelMap = Codable & Hashable

// Base for Model
protocol Model : Codable & Hashable {
    var id: String? { get set }
}
