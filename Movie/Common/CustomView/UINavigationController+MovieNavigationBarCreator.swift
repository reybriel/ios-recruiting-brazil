import class UIKit.UIImage
import class UIKit.UINavigationController
import class UIKit.UIViewController

protocol MovieNavigationBarCreator {
    func createMovieNavigationBar() -> UINavigationController
    func with(rootViewController: UIViewController) -> UINavigationController
}

extension UINavigationController: MovieNavigationBarCreator {
    func createMovieNavigationBar() -> UINavigationController {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = ColorName.primary.color
        navigationBar.tintColor = ColorName.secondary.color
        navigationBar.titleTextAttributes = [.foregroundColor: ColorName.secondary.color]
        navigationBar.shadowImage = UIImage()
        return self
    }

    func with(rootViewController: UIViewController) -> UINavigationController {
        setViewControllers([rootViewController], animated: false)
        return self
    }
}
