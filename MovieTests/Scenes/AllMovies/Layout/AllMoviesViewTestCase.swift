@testable
import Movie
import XCTest

final class AllMoviesTestCase: XCTestCase {
    private var sut: AllMoviesView!

    private var collectionView: UICollectionView! {
        sut.subview(withAccessibilityIdentifier: "moviesCollectionView")
    }

    override func setUp() {
        sut = AllMoviesView(frame: frame300)
    }

    override func tearDown() {
        sut = nil
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

    func test_collectionView_hasToHaveTheSameSizeAndPositionAsAllMoviesView() {
        sut.layoutIfNeeded()
        XCTAssertEqual(collectionView.frame, sut.frame)
    }
}
