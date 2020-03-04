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

    func test_start_hasToEmitOnce() {
        MVAssertSequenceEmitsOnlyOnce(sut.start())
    }
}
