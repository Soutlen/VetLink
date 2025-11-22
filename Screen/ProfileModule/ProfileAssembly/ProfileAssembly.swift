
import UIKit

enum ProfileAssembly {
    
    static func build() -> UIViewController {
        let viewController = ProfileViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
