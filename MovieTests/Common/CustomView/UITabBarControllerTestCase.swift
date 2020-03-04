@testable
import Movie
import XCTest

final class UITabBarControllerTestCase: XCTestCase {
    private let viewControllers: [UIViewController] = [.init(), .init()]

    private var movieTabBarController: UITabBarController {
        UITabBarController().createMovieTabBar()
    }

    private var composedTabBarController: UITabBarController {
        UITabBarController().with(viewControllers: viewControllers)
    }

    //  UITabBarController.createMovieTabBar

    func test_createMovieTabBar_hasToReturnANonTranslucentTabBar() {
        XCTAssertFalse(movieTabBarController.tabBar.isTranslucent)
    }

    func test_createMovieTabBar_hasToSetAPrimaryColorToBarTint() {
        XCTAssertEqual(movieTabBarController.tabBar.barTintColor, ColorName.primary.color)
    }

    func test_createMovieTabBar_hasToSetASecondaryColorToTint() {
        XCTAssertEqual(movieTabBarController.tabBar.tintColor, ColorName.secondary.color)
    }

    // UITaBarController.with(viewControllers:)

    func test_with_viewControllers_hasToReturnATabBarWithTheGivenControllers() {
        XCTAssertEqual(composedTabBarController.viewControllers, viewControllers)
    }
}
