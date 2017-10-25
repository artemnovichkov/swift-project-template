//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.organization_name }}. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let appInfo = Bundle.main.infoDictionary,
            let shortVersionString = appInfo["CFBundleShortVersionString"] as? String,
            let bundleVersion = appInfo["CFBundleVersion"] as? String {
            let appVersion = "\(shortVersionString) (\(bundleVersion))"
            UserDefaults.standard.appVersion = appVersion
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

fileprivate extension UserDefaults {

    var appVersion: String? {
        get { 
            return string(forKey: #function) 
        }
        set { 
            set(newValue, forKey: #function) 
        }
    }
}
