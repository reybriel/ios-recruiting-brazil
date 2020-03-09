@testable
import Movie
import XCTest

final class SearchBarContainerViewTestCase: XCTestCase {
    private let view: UIView = .init()
    private var sut: SearchBarContainerView!

    private var searchBar: UISearchBar! {
        sut.subview(withAccessibilityIdentifier: "searchBar") as? UISearchBar
    }

    private var containerView: UIView! {
        sut.subview(withAccessibilityIdentifier: "containerView")
    }

    override func setUp() {
        sut = SearchBarContainerView(frame: frame300)
    }

    override func tearDown() {
        sut = nil
    }

    func test_sut_hasToHaveASearchBar() {
        XCTAssertNotNil(searchBar)
    }

    func test_searchBar_hasToHaveAnEmptyBackgroundImage() {
        XCTAssertEqual(searchBar.backgroundImage, UIImage())
    }

    func test_searchBar_hasToHaveAPrimaryColorBackground() {
        XCTAssertEqual(searchBar.backgroundColor, ColorName.primary.color)
    }

    func test_searchBar_hasToHaveASecondaryColorAsTint() {
        XCTAssertEqual(searchBar.tintColor, ColorName.secondary.color)
    }

    func test_searchBar_hasToShowCancelButton() {
        XCTAssertTrue(searchBar.showsCancelButton)
    }

    func test_searchBar_hasToBeOnTopOfTheContainerView() {
        sut.layoutIfNeeded()
        let searchBarOrigin = searchBar.convert(searchBar.frame.origin, to: sut.coordinateSpace)
        XCTAssertEqual(sut.frame.origin.y, searchBarOrigin.y)
    }

    func test_searchBar_hasToBeHorizontallyCenteredOnTheContainerView() {
        sut.layoutIfNeeded()
        let searchBarCenter = searchBar.convert(searchBar.center, to: sut.coordinateSpace)
        XCTAssertEqual(sut.center.x, searchBarCenter.x)
    }

    func test_searchBar_hasToHaveTheSameWidthAsTheContainerView() {
        sut.layoutIfNeeded()
        XCTAssertEqual(sut.frame.width, searchBar.frame.width)
    }

    func test_searchBar_hasToHaveASpecificHeight() {
        sut.layoutIfNeeded()
        XCTAssertEqual(searchBar.frame.height, 56)
    }

    func test_sut_hasToHaveAContainerView() {
        XCTAssertNotNil(containerView)
    }

    func test_containerView_hasToHaveATransparentBackground() {
        XCTAssertEqual(containerView.backgroundColor, .clear)
    }

    func test_containerView_hasToSameWidthAsTheContainerView() {
        sut.layoutIfNeeded()
        XCTAssertEqual(sut.frame.width, containerView.frame.width)
    }

    func test_containerView_hasToOccupyAllTheRaminingSpaceInTheContainerView() {
        sut.layoutIfNeeded()
        XCTAssertEqual(containerView.frame.height, 244)
    }

    func test_containerView_hasToBeHorizontallyCenteredInTheContainerView() {
        sut.layoutIfNeeded()
        let containerViewCenter = containerView.convert(containerView.center, to: sut.coordinateSpace)
        XCTAssertEqual(sut.center.x, containerViewCenter.x)
    }

    func test_setContainerView_hasToSetAViewAsTheContanerViewSubview() {
        sut.setContainerView(view)
        XCTAssertTrue(containerView.subviews.first === view)
    }

    func test_setContainerView_hasToSetAllowOnlyOneViewAsTheContainerSubview() {
        sut.setContainerView(view)
        sut.setContainerView(UIView())
        XCTAssertEqual(containerView.subviews.count, 1)
    }

    func test_setContainerView_hasToArrangeSubviewToFillTheContainerSpace() {
        sut.layoutIfNeeded()
        sut.setContainerView(view)
        XCTAssertEqual(view.frame.origin, .zero)
        XCTAssertEqual(containerView.frame.size, view.frame.size)
    }
}
