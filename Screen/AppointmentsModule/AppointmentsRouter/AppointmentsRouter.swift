
import UIKit

protocol IAppointmentsRouter: AnyObject {
    func showCreateAppointment(doctorId: UUID, doctorName: String, doctorSpecialty: String)
}

final class AppointmentsRouter {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension AppointmentsRouter: IAppointmentsRouter {
    
    func showCreateAppointment(doctorId: UUID, doctorName: String, doctorSpecialty: String) {
        let createVC = AppointmentsAssembly.build()
        
        let navigationController = UINavigationController(rootViewController: createVC)
        viewController?.present(navigationController, animated: true)
    }
}
