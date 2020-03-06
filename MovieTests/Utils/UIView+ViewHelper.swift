import UIKit

protocol ViewHelper {
    func subview<T>(withAccessibilityIdentifier: String) -> T! where T: UIView
}

extension UIView: ViewHelper {
    func subview<T>(withAccessibilityIdentifier identifier: String) -> T! where T: UIView {
        subviews.first { view in
            view.accessibilityIdentifier == identifier
        } as? T
    }
}
