import UIKit

protocol ViewHelper {
    func subview<T>(withAccessibilityIdentifier: String) -> T! where T: UIView
    @discardableResult func activate() -> UIWindow
}

extension UIView: ViewHelper {
    func subview<T>(withAccessibilityIdentifier identifier: String) -> T! where T: UIView {
        subviews.first { view in
            view.accessibilityIdentifier == identifier
        } as? T
    }

    @discardableResult func activate() -> UIWindow {
        let window = UIWindow()
        window.addSubview(self)
        return window
    }
}
