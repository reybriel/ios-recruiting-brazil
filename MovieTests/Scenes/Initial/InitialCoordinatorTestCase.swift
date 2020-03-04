@testable
import Movie
import RxSwift
import XCTest

final class InitialCoordinatorTestCase: XCTestCase {
    private var sut: InitialCoordinator!

    override func setUp() {
        sut = InitialCoordinator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_start_hasToCreateATabBarController() {
        MVAssertViewController(createBy: sut, isKindOf: UITabBarController.self)
    }

    func test_start_hasToEmitOnce() {
        MVAssertSequenceEmitsOnlyOnce(sut.start())
    }
}
