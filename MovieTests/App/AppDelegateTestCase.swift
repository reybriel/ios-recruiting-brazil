@testable
import Movie
import XCTest

final class AppDelegateTestCase: XCTestCase {
    private var sut: AppDelegate!

    override func setUp() {
        sut = AppDelegate()
    }

    override func tearDown() {
        sut = nil
    }

    func test_application_didFinishLaunchingWithOptions_hasToSetAWindow() {
        _ = sut.application(.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertNotNil(sut.window)
    }
}
