@testable
import Movie
import class RxSwift.Observable
import XCTest

protocol Assertions {
    func MVAssertSequenceEmitsOnlyOnce(_ sequence: Observable<Any>)
    func MVAssertViewController<T>(createBy coordinator: Coordinator, isKindOf: T.Type)
    func MVAssertInstance<T, U>(_ instance: T, isKindOf: U.Type)
}

extension XCTestCase: Assertions {
    func MVAssertSequenceEmitsOnlyOnce<Element>(_ sequence: Observable<Element>) {
        var lastIndex: Int = .max

        let viewControllerSequence = sequence
            .enumerated()
            .subscribe(onNext: { index, _ in
                lastIndex = index
            }, onCompleted: {
                XCTAssertFalse(lastIndex > 0)
            })

        viewControllerSequence.dispose()
    }

    func MVAssertViewController<T>(createBy coordinator: Coordinator, isKindOf _: T.Type) {
        var isKinfOdGivenType = false
        let viewControllerSequence = coordinator.start()
            .subscribe(onNext: { viewController in
                isKinfOdGivenType = viewController is T
            })

        viewControllerSequence.dispose()
        XCTAssertTrue(isKinfOdGivenType)
    }

    func MVAssertInstance<T, U>(_ instance: T, isKindOf _: U.Type) {
        XCTAssertTrue(instance is U)
    }
}
