@testable
import Movie

struct EndpointMock: Endpoint {
    var path: String { "/test/path" }
    var method: HTTPMethod { .post }
    var body: BodyMock { .mock }
    var query: [String: String] { ["queryKey": "queryValue"] }
}

struct BodyMock: Codable {
    let fieldA: String
    let fieldB: Int
    static let mock: BodyMock = .init(fieldA: "value", fieldB: 2)
}
