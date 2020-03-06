@testable
import Movie
import XCTest

final class ViewCodeTestCase: XCTestCase {
    private var spy: ViewCodeSpy!

    override func setUp() {
        spy = ViewCodeSpy()
    }

    override func tearDown() {
        spy = nil
    }

    func test_setupView_hasToInvokeAllInnerMethods() {
        spy.setupView()
        XCTAssertTrue(spy.invokedSetupHierarchy)
        XCTAssertTrue(spy.invokedSetupAutolayout)
        XCTAssertTrue(spy.invokedSetupExtraConfigurations)
    }
}
