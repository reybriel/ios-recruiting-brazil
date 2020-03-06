@testable
import Movie
import UIKit

extension Coordinator {
    var viewController: UIViewController! {
        var vc: UIViewController!
        let disposable = start().subscribe(onNext: { viewController in
            vc = viewController
        })
        disposable.dispose()
        return vc
    }
}
