import Foundation

final class URLSessionStub: URLSession {
    private(set) var dataTask: URLSessionDataTaskSpy!
    private(set) var receivedRequest: URLRequest!

    var responseStatusCode: Int = 200
    var responseData: Data?

    override init() {}

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        receivedRequest = request
        dataTask = URLSessionDataTaskSpy()
        let response = HTTPURLResponse(url: request.url!, statusCode: responseStatusCode, httpVersion: nil, headerFields: nil)
        completionHandler(responseData, response, nil)
        return dataTask
    }
}
