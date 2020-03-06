@testable
import Movie

final class ViewCodeSpy: ViewCode {
    private(set) var invokedSetupHierarchy = false
    private(set) var invokedSetupAutolayout = false
    private(set) var invokedSetupExtraConfigurations = false

    func setupHierarchy() {
        invokedSetupHierarchy = true
    }

    func setupAutolayout() {
        invokedSetupAutolayout = true
    }

    func setupExtraConfigurations() {
        invokedSetupExtraConfigurations = true
    }
}
