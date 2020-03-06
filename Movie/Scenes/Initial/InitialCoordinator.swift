import class RxSwift.Observable
import UIKit

final class InitialCoordinator: Coordinator {
    func start() -> Observable<UIViewController> {
        Observable.zip(AllMoviesCoordinator().start(), FavoriteMoviesCoordinator().start())
            .take(1)
            .map { [navigationController] allMoviesVC, favoriteMoviesVC in
                let viewControllers = [navigationController(allMoviesVC),
                                       navigationController(favoriteMoviesVC)]
                return UITabBarController()
                    .createMovieTabBar()
                    .with(viewControllers: viewControllers)
            }
    }

    private func navigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = ColorName.primary.color
        navigationController.navigationBar.tintColor = ColorName.secondary.color
        return navigationController
    }
}
