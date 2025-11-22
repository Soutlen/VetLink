import UIKit

enum DoctorsDetailAssembly {
    
    static func build(with viewModel: DoctorsDetailEntity) -> UIViewController {
        let viewController = DoctorsDetailViewController()
        let presenter = DoctorsDetailPresenter(viewModel: viewModel)
        
        viewController.presenter = presenter
        presenter.configureView(view: viewController)
        
        return viewController
    }
}
