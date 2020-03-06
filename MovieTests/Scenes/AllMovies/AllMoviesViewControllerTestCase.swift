@testable
import Movie
import XCTest

final class AllMoviesViewControllerTestCase: XCTestCase {
    private var sut: AllMoviesViewController!

    override func setUp() {
        sut = AllMoviesViewController()
    }

    override func tearDown() {
        sut = nil
    }

    func test_sut_hasTheCorrectTitle() {
        XCTAssertEqual(sut.title, L10n.AllMovies.title)
    }

    func test_assignTitle_hasToNotChangeItsValue() {
        let title = "Some title!"
        sut.title = title
        XCTAssertNotEqual(sut.title, title)
    }

    func test_tabBarItem_hasToNotBeNil() {
        XCTAssertNotNil(sut.tabBarItem)
    }

    func test_view_hasToBeAnAllMoviesView() {
        XCTAssertTrue(sut.view is AllMoviesView)
    }
}
