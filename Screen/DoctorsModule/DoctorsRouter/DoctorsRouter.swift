
import UIKit

protocol IDoctorsRouter {
    func showDoctorDetail(with doctor: DoctorsDetailEntity)
}

final class DoctorsRouter {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension DoctorsRouter: IDoctorsRouter {
    func showDoctorDetail(with displayItem: DoctorsDetailEntity) {
        let detailViewController = DoctorsDetailAssembly.build(with: displayItem)
        
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
