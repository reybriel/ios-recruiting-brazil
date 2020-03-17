import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    associatedtype BodyType: Encodable

    var path: String { get }
    var method: HTTPMethod { get }
    var body: BodyType { get }
    var query: [String: String] { get }
}

extension Endpoint {
    var httpMethod: String { method.rawValue }
    var httpBody: Data? { try? JSONEncoder().encode(body) }
    var queryItems: [URLQueryItem] { query.map { URLQueryItem(name: $0.key, value: $0.value) } }
}
