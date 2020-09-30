import Core

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        Logger.log(Strings.Welcome.title.translation)
        logEnvironment()
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = UINavigationController(rootViewController: ViewController())
        window.makeKeyAndVisible()
        return true
    }

    private func logEnvironment() {
        #if PROD
            Logger.log("Welcome to the PRODUCTION environment!")
        #elseif DEVEL
            Logger.log("Welcome to the DEVELOPMENT environment!")
        #endif
    }
}
