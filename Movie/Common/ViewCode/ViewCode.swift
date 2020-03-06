protocol ViewCode {
    func setupHierarchy()
    func setupAutolayout()
    func setupExtraConfigurations()
}

extension ViewCode {
    func setupExtraConfigurations() {}
    func setupView() {
        setupHierarchy()
        setupAutolayout()
        setupExtraConfigurations()
    }
}
