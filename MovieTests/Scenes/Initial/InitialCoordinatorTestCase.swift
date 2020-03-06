@testable
import Movie
import RxSwift
import XCTest

final class InitialCoordinatorTestCase: XCTestCase {
    private var sut: InitialCoordinator!

    private var tabBarController: UITabBarController! {
        sut.viewController as? UITabBarController
    }

    override func setUp() {
        sut = InitialCoordinator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_start_hasToCreateATabBarController() {
        MVAssertViewController(createBy: sut, isKindOf: UITabBarController.self)
    }

    func test_start_hasToEmitOnce() {
        MVAssertSequenceEmitsOnlyOnce(sut.start())
    }

    func test_tabBar_hasToHaveTwoTabs() {
        XCTAssertEqual(tabBarController.viewControllers!.count, 2)
    }

    func test_tabs_hasToBeNavigationControllers() {
        tabBarController.viewControllers!.forEach { viewController in
            MVAssertInstance(viewController, isKindOf: UINavigationController.self)
        }
    }

    func test_tabBarController_hasToHaveAProperAppearence() {
        XCTAssertFalse(tabBarController.tabBar.isTranslucent)
        XCTAssertEqual(tabBarController.tabBar.barTintColor, ColorName.primary.color)
        XCTAssertEqual(tabBarController.tabBar.tintColor, ColorName.secondary.color)
    }

    func test_navigationControllers_hasToHaveAProperAppearence() {
        tabBarController.viewControllers!.forEach { viewController in
            let navigationController = viewController as! UINavigationController
            XCTAssertFalse(navigationController.navigationBar.isTranslucent)
            XCTAssertEqual(navigationController.navigationBar.barTintColor, ColorName.primary.color)
            XCTAssertEqual(navigationController.navigationBar.tintColor, ColorName.secondary.color)
        }
    }

    func test_firstNavigationController_hasToContainAllMovies() {
        let navigationController = tabBarController.viewControllers![0] as! UINavigationController
        MVAssertInstance(navigationController.visibleViewController, isKindOf: AllMoviesViewController.self)
    }

    func test_secondNavigationController_hasToContainFavoriteMovies() {
        let navigationController = tabBarController.viewControllers![1] as! UINavigationController
        MVAssertInstance(navigationController.visibleViewController, isKindOf: UIViewController.self)
    }
}
