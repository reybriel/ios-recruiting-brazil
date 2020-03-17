import Foundation

final class URLSessionDataTaskSpy: URLSessionDataTask {
    private(set) var invokedResume: Bool
    private(set) var invokedCancel: Bool

    override init() {
        invokedResume = false
        invokedCancel = false
    }

    override func resume() {
        invokedResume = true
    }

    override func cancel() {
        invokedCancel = true
    }
}
