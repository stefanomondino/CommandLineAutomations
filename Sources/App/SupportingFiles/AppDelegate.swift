import Core
import RxSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = {
        Logger.log(Strings.Welcome.title.translation)
        logEnvironment()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: ViewController())
        window.makeKeyAndVisible()
        return window
    }()

    private func logEnvironment() {
        #if PROD
            Logger.log("Welcome to the PRODUCTION environment!")
        #elseif DEVEL
            Logger.log("Welcome to the DEVELOPMENT environment!")
        #endif
    }
}

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
