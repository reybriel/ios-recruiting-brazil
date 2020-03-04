@testable
import Movie
import XCTest

final class UIWindowFactoryTestCase: XCTestCase {
    private var sut: UIWindowFactory!
    private var resultWindow: UIWindow!

    private let viewController = UIViewController()

    override func setUp() {
        sut = UIWindowFactory(viewController: viewController)
        resultWindow = sut.make()
    }

    override func tearDown() {
        sut = nil
        resultWindow = nil
    }

    func test_make_hasToPresentGivenViewController() {
        XCTAssertTrue(resultWindow.rootViewController === viewController)
    }

    func test_make_hasToReturnAKeyWindow() {
        XCTAssertTrue(resultWindow.isKeyWindow)
    }

    func test_make_hasToReturnAVisibleWindow() {
        XCTAssertFalse(resultWindow.isHidden)
    }
}
