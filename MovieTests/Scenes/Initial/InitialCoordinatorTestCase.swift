@testable
import Movie
import RxSwift
import XCTest

final class InitialCoordinatorTestCase: MovieTestCase<InitialCoordinator> {
    override func setUp() {
        sut = InitialCoordinator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_firstViewController_hasToBeTabBarController() {
        XCTAssertTrue(createdViewController(isKindOf: UITabBarController.self))
    }
}
