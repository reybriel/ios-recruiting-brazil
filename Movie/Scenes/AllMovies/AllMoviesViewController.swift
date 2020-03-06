import UIKit

final class AllMoviesViewController: UIViewController {
    override var title: String? {
        get { L10n.AllMovies.title }
        set { super.title = newValue }
    }

    override func loadView() {
        view = AllMoviesView()
    }
}
