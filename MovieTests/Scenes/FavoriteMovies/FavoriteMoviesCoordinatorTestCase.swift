@testable
import Movie
import RxSwift
import XCTest

final class FavoriteMoviesCoordinatorTestCase: XCTestCase {
    private var sut: FavoriteMoviesCoordinator!

    override func setUp() {
        sut = FavoriteMoviesCoordinator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_viewController_hasToHaveAProperTabBarItem() {
        let item = sut.viewController.tabBarItem!
        XCTAssertEqual(item.title, L10n.TabBar.favoriteMovies)
        XCTAssertEqual(item.image, Asset.favoriteEmptyIcon.image)
    }

    func test_start_hasToEmitOnce() {
        MVAssertSequenceEmitsOnlyOnce(sut.start())
    }
}
