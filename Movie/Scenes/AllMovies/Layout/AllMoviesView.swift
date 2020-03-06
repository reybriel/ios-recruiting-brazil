import SnapKit
import UIKit

final class AllMoviesView: UIView {
    private let searchBarContainerView: SearchBarContainerView = {
        let view = SearchBarContainerView()
        view.accessibilityIdentifier = "searchBarContainer"
        return view
    }()

    private let moviesCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.accessibilityIdentifier = "moviesCollectionView"
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
}

extension AllMoviesView: ViewCode {
    func setupHierarchy() {
        addSubview(searchBarContainerView)
        searchBarContainerView.setContainerView(moviesCollectionView)
    }

    func setupAutolayout() {
        searchBarContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupExtraConfigurations() {
        backgroundColor = ColorName.stepWhite.color
    }
}
