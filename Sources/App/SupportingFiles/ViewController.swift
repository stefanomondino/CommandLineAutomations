import Core
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Strings.Generic.hello.translation
        let image = UIImageView(image: Asset.heart.image)
        view.addSubview(image)
        image.contentMode = .center
        image.frame = view.bounds
    }
}
