import FirebaseFirestore

typealias ModelMap = Codable & Hashable

protocol Model : Codable & Hashable {
    var id: String? { get set }
}
