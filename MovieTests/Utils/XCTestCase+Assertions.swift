import class RxSwift.Observable
import XCTest

protocol Assertions {
    func AssertSequenceEmitsOnce(_ sequence: Observable<Any>)
}

extension XCTestCase: Assertions {
    func AssertSequenceEmitsOnce<Element>(_ sequence: Observable<Element>) {
        let sequenceIsCompleted = expectation(description: "viewControllerSequenceIsCompleted")

        let viewControllerSequence = sequence
            .subscribe(onCompleted: sequenceIsCompleted.fulfill)

        wait(for: [sequenceIsCompleted], timeout: 0)
        viewControllerSequence.dispose()
    }
}
