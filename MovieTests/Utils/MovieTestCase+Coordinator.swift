@testable
import Movie

extension MovieTestCase where SystemUnderTest: Coordinator {
    func test_viewControllerSequence_hasToEmitOnce() {
        AssertSequenceEmitsOnce(sut.start())
    }

    func createdViewController<T>(isKindOf _: T.Type) -> Bool {
        var isKinfOdGivenType = false
        let viewControllerSequence = sut.start()
            .subscribe(onNext: { viewController in
                isKinfOdGivenType = viewController is T
            })

        viewControllerSequence.dispose()
        return isKinfOdGivenType
    }
}
