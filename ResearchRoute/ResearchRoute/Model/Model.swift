import FirebaseFirestore

typealias ModelMap = Codable & Hashable

protocol Model : Codable {
    var id: String? { get set }
}
