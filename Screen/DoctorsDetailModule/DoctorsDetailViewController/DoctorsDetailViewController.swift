import UIKit

final class DoctorsDetailViewController: UIViewController {
    
    var presenter: IDoctorsDetailPresenterInput?
    private let doctorDetailView = DoctorsDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Врач"
        
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        view = doctorDetailView
    }
}

extension DoctorsDetailViewController: IDoctorsDetailViewInput {
    func display(viewModel: DoctorsDetailEntity) {
        doctorDetailView.display(viewModel: viewModel)
    }
}
