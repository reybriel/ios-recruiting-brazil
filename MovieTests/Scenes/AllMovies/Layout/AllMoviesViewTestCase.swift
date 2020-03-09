@testable
import Movie
import XCTest

final class AllMoviesTestCase: XCTestCase {
    private var sut: AllMoviesView!

    private var searchBarContainerView: SearchBarContainerView! {
        sut.subview(withAccessibilityIdentifier: "searchBarContainerView")
    }

    private var collectionView: UICollectionView! {
        searchBarContainerView
            .subview(withAccessibilityIdentifier: "containerView")?
            .subview(withAccessibilityIdentifier: "moviesCollectionView")
    }

    override func setUp() {
        sut = AllMoviesView(frame: frame300)
    }

    override func tearDown() {
        sut = nil
    }

    func test_searchBarContainerView_hasToHaveASearchBarContainerAsSbuview() {
        XCTAssertNotNil(searchBarContainerView)
    }

    func test_searchBarContainerView_hasToHaveTheSameSizeAndPositionAsAllMoviesView() {
        sut.layoutIfNeeded()
        XCTAssertEqual(searchBarContainerView.frame, sut.frame)
    }

    func test_searchBarContainerView_hasToContainTheMoviesCollectionView() {
        XCTAssertNotNil(collectionView)
    }

    func test_sut_hasToHaveAWhiteBackground() {
        XCTAssertEqual(sut.backgroundColor, ColorName.stepWhite.color)
    }

    func test_collectionView_hasToHaveAClearBackground() {
        XCTAssertEqual(collectionView.backgroundColor, .clear)
    }

    func test_collectionView_hasToHaveAFlowLayout() {
        XCTAssertTrue(collectionView.collectionViewLayout is UICollectionViewFlowLayout)
    }
}
