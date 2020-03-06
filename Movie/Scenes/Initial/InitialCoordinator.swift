import class RxSwift.Observable
import UIKit

final class InitialCoordinator: Coordinator {
    func start() -> Observable<UIViewController> {
        Observable.zip(AllMoviesCoordinator().start(), FavoriteMoviesCoordinator().start())
            .take(1)
            .map { allMoviesVC, favoriteMoviesVC in
                let viewControllers = [UINavigationController(rootViewController: allMoviesVC),
                                       UINavigationController(rootViewController: favoriteMoviesVC)]
                return UITabBarController()
                    .createMovieTabBar()
                    .with(viewControllers: viewControllers)
            }
    }
}
