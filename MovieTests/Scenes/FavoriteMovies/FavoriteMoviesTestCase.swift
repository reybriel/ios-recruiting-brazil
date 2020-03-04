@testable
import Movie
import RxSwift
import XCTest

final class FavoriteMoviesCoordinatorTestCase: MovieTestCase<FavoriteMoviesCoordinator> {
    override func setUp() {
        sut = FavoriteMoviesCoordinator()
    }

    override func tearDown() {
        sut = nil
    }
}
