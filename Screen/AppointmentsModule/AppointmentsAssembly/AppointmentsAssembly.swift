import UIKit

enum AppointmentsAssembly {
    
    static func build() -> UIViewController {

        let view = AppointmentsViewController()
        
        let navigationController = UINavigationController(rootViewController: view)
        
        return navigationController
    }
}
