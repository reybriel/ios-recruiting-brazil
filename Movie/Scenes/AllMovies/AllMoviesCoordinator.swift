import class RxSwift.Observable
import UIKit

final class AllMoviesCoordinator: Coordinator {
    func start() -> Observable<UIViewController> {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        viewController.tabBarItem = UITabBarItem(title: L10n.TabBar.allMovies,
                                                 image: Asset.listIcon.image,
                                                 selectedImage: nil)
        return Observable.just(viewController)
    }
}
