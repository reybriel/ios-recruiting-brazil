@testable
import Movie
import RxSwift
import XCTest

final class AllMoviesCoordinatorTestCase: MovieTestCase<AllMoviesCoordinator> {
    override func setUp() {
        sut = AllMoviesCoordinator()
    }

    override func tearDown() {
        sut = nil
    }
}
