@testable
import Movie
import RxSwift
import XCTest

final class AllMoviesCoordinatorTestCase: XCTestCase {
    private var sut: AllMoviesCoordinator!

    override func setUp() {
        sut = AllMoviesCoordinator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_start_hasToCreateAnAllMoviesViewController() {
        MVAssertViewController(createBy: sut, isKindOf: AllMoviesViewController.self)
    }

    func test_viewController_hasToHaveAProperTabBarItem() {
        let item = sut.viewController.tabBarItem!
        XCTAssertEqual(item.title, L10n.TabBar.allMovies)
        XCTAssertEqual(item.image, Asset.listIcon.image)
    }

    func test_start_hasToEmitOnce() {
        MVAssertSequenceEmitsOnlyOnce(sut.start())
    }
}
