@testable
import Movie
import XCTest

final class URLSessionClientTestCase: XCTestCase {
    private var sessionStub: URLSessionStub!
    private var sut: URLSessionClient!

    private let endpointMock: EndpointMock = .init()

    private var request: URLRequest {
        sessionStub.receivedRequest
    }

    private var dataTaskSpy: URLSessionDataTaskSpy {
        sessionStub.dataTask
    }

    override func setUp() {
        sessionStub = URLSessionStub()
        sut = URLSessionClient(session: sessionStub, base: TestNetworkBase.self)
    }

    override func tearDown() {
        sessionStub = nil
        sut = nil
    }

    func test_sut_hasToConformToNetworkClientProtocol() {
        MVAssertInstance(sut, isKindOf: NetworkClient.self)
    }

    func test_request_hasToCreateAndResumeADataTask() {
        sut.request(endpoint: endpointMock).subscribe().dispose()
        XCTAssertTrue(dataTaskSpy.invokedResume)
    }

    func test_request_whenObservableIsDisposed_hasToCancelTheDataTask() {
        sut.request(endpoint: endpointMock).subscribe().dispose()
        XCTAssertTrue(dataTaskSpy.invokedCancel)
    }

    func test_request_hasToRequestToGivenEndpoint() {
        sut.request(endpoint: endpointMock).subscribe().dispose()
        XCTAssertEqual(request.url!.relativePath, endpointMock.path)
    }

    func test_request_wheReturnWithSuccess_hasToEmitOnNextEvent() {
        let isOnNext = expectation(description: "event_isOnNext")
        sessionStub.responseData = endpointMock.httpBody

        sut.request(endpoint: endpointMock)
            .subscribe(onNext: { isOnNext.fulfill() })
            .dispose()

        wait(for: [isOnNext], timeout: 0.0)
    }

    func test_request_whenReturnWithSuccess_hasToEmitOnNextEventWithADecodedObject() {
        let isBodyMock = expectation(description: "body_isBodyMock")
        sessionStub.responseData = endpointMock.httpBody

        sut.request(endpoint: endpointMock)
            .subscribe(onNext: { (_: BodyMock) in isBodyMock.fulfill() })
            .dispose()

        wait(for: [isBodyMock], timeout: 0.0)
    }

    func test_request_whenReturnWithFailure_hasToEmitAnErrorEventWithAStatusCodeError() {
        sessionStub.responseStatusCode = 404

        sut.request(endpoint: endpointMock)
            .subscribe(onError: { error in
                guard case let NetworkError.statusCode(code) = error else { XCTFail(); return }
                XCTAssertEqual(code, 404)
            })
            .dispose()
    }
}
