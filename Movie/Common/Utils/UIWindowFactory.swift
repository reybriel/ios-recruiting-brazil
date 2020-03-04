import UIKit

struct UIWindowFactory {
    let viewController: UIViewController
    func make() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        return window
    }
}
