import Foundation
@testable
import Movie
import XCTest

final class URLRequestBuilderTestCase: XCTestCase {
    private var sut: URLRequestBuilder<EndpointMock>!

    private let endpointMock: EndpointMock = .init()

    override func setUp() {
        sut = URLRequestBuilder(base: TestNetworkBase.self, endpoint: endpointMock)
    }

    override func tearDown() {
        sut = nil
    }

    func test_build_hasToCreateARequestWithAProperHost() {
        XCTAssertTrue(sut.build().url!.absoluteString.starts(with: TestNetworkBase.apiDomain))
    }

    func test_build_hasToCreateARequestWithAProperPath() {
        XCTAssertEqual(sut.build().url!.path, endpointMock.path)
    }

    func test_build_hasToCreateARequestWithAProperMethod() {
        XCTAssertEqual(sut.build().httpMethod, endpointMock.httpMethod)
    }

    func test_build_hasToCreateARequestWithTheGivenBody() {
        let request = sut.build()
        XCTAssertNotNil(request.httpBody)
        XCTAssertNotNil(try? JSONDecoder().decode(BodyMock.self, from: request.httpBody!))
    }

    func test_build_hasToCreateARequestWithTheGivenQuery() {
        let request = sut.build()
        XCTAssertTrue(request.url!.query!.contains("queryKey=queryValue"))
    }

    func test_build_hasTOCreateARequestWithTheAPIKey() {
        let apiKeyQuery = "api_key=\(TestNetworkBase.apiKey)"
        let request = sut.build()
        XCTAssertTrue(request.url!.query!.contains(apiKeyQuery))
    }
}
