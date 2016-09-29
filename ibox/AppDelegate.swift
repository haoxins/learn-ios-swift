
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        navigationController = UINavigationController()
        navigationController!.navigationBar.isHidden = true

        let viewController: UIViewController = SigninController()

        self.navigationController!.pushViewController(viewController, animated: false)

        self.window = UIWindow(frame: UIScreen.main().bounds)

        self.window!.rootViewController = navigationController

        self.window!.makeKeyAndVisible()

        return true
    }
}
