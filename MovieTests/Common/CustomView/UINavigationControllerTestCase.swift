@testable
import Movie
import XCTest

final class UINavigationControllerTestCase: XCTestCase {
    private let viewController: UIViewController = .init()

    private var movieNavigationController: UINavigationController {
        UINavigationController().createMovieNavigationBar()
    }

    private var composedNavigationController: UINavigationController {
        UINavigationController().with(rootViewController: viewController)
    }

    //  UINavigationController.createMovieNavigationBar

    func test_createMovieNavigationBar_hasToReturnBorderlessNavigationBar() {
        XCTAssertEqual(movieNavigationController.navigationBar.shadowImage, UIImage())
    }

    func test_createMovieNavigationBar_hasToReturnANonTranslucentNavigationBar() {
        XCTAssertFalse(movieNavigationController.navigationBar.isTranslucent)
    }

    func test_createMovieNavigationBar_hasToSetAPrimaryColorToBarTint() {
        XCTAssertEqual(movieNavigationController.navigationBar.barTintColor, ColorName.primary.color)
    }

    func test_createMovieNavigationBar_hasToSetASecondaryColorToTint() {
        XCTAssertEqual(movieNavigationController.navigationBar.tintColor, ColorName.secondary.color)
    }

    func test_createMovieNavigationBar_hasToSetASecondaryColorToTitleForegroundColor() {
        let titleForegroundColor = movieNavigationController.navigationBar
            .titleTextAttributes![.foregroundColor] as! UIColor
        XCTAssertEqual(titleForegroundColor, ColorName.secondary.color)
    }

    // UINavigationController.with(rootViewController:)

    func test_with_rootViewController_hasToReturnANavigationBarWithTheGivenRootController() {
        XCTAssertTrue(composedNavigationController.visibleViewController === viewController)
    }
}
