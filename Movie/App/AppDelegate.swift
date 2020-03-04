import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewControllerCreation = InitialCoordinator().start()
            .map { viewController in UIWindowFactory(viewController: viewController) }
            .subscribe(onNext: { [weak self] factory in
                self?.window = factory.make()
            })
        viewControllerCreation.dispose()

        return true
    }
}
