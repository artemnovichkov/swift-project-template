//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.organization_name }}. All rights reserved.
//

import Foundation{% if cookiecutter.firebase == "Yes" %}
import Firebase
{% endif %}
final class AppConfigurator {

    static func configure() {
        guard let appInfo = Bundle.main.infoDictionary,
            let shortVersionString = appInfo["CFBundleShortVersionString"] as? String,
            let bundleVersion = appInfo["CFBundleVersion"] as? String else {
                return
        }
        let appVersion = "\(shortVersionString) (\(bundleVersion))"
        UserDefaults.standard.appVersion = appVersion{% if cookiecutter.firebase == "Yes" %}
        FirebaseApp.configure(){% endif %}
    }
}

private extension UserDefaults {

    var appVersion: String? {
        get {
            return string(forKey: #function)
        }
        set {
            set(newValue, forKey: #function)
        }
    }
}
