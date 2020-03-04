@testable
import Movie
import XCTest

final class UIWindowFactoryTestCase: MovieTestCase<UIWindowFactory> {
    private let viewController = UIViewController()

    override func setUp() {
        sut = UIWindowFactory(viewController: viewController)
    }

    override func tearDown() {
        sut = nil
    }

    func test_make_hasToPresentGivenViewController() {
        let window = sut.make()
        XCTAssertTrue(window.rootViewController === viewController)
    }

    func test_make_hasToMakeWindowKeyAndVisible() {
        let window = sut.make()
        XCTAssertTrue(window.isKeyWindow)
        XCTAssertFalse(window.isHidden)
    }
}
