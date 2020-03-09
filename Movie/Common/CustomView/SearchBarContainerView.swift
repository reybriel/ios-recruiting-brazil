import RxCocoa
import RxSwift
import UIKit

final class SearchBarContainerView: UIView {
    private let disposeBag: DisposeBag = .init()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = ColorName.primary.color
        searchBar.tintColor = ColorName.secondary.color
        searchBar.accessibilityIdentifier = "searchBar"
        searchBar.showsCancelButton = true
        return searchBar
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "containerView"
        view.backgroundColor = .clear
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setContainerView(_ view: UIView) {
        containerView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        containerView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        setNeedsLayout()
        layoutIfNeeded()
    }
}

extension SearchBarContainerView: ViewCode {
    func setupHierarchy() {
        addSubview(searchBar)
        addSubview(containerView)
    }

    func setupAutolayout() {
        searchBar.snp.makeConstraints { make in
            make.top
                .width
                .centerX
                .equalToSuperview()
            make.height.equalTo(56)
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.width
                .bottom
                .centerX
                .equalToSuperview()
        }
    }

    func setupExtraConfigurations() {
        searchBar.rx.cancelButtonClicked
            .subscribe(onNext: { [weak searchBar] in
                searchBar?.resignFirstResponder()
            })
            .disposed(by: disposeBag)
    }
}
