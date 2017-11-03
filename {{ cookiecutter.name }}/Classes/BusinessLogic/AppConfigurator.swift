//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation

final class AppConfigurator {

    static func configure() {
        guard let appInfo = Bundle.main.infoDictionary,
            let shortVersionString = appInfo["CFBundleShortVersionString"] as? String,
            let bundleVersion = appInfo["CFBundleVersion"] as? String else {
                return
        }
        let appVersion = "\(shortVersionString) (\(bundleVersion))"
        UserDefaults.standard.appVersion = appVersion
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
