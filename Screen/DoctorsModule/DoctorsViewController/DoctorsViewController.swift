import UIKit

final class DoctorsViewController: UIViewController {
    
    var presenter: IDoctorsPresenterInput?
    private let doctorsView = DoctorsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Доктора"
        edgesForExtendedLayout = []
        extendedLayoutIncludesOpaqueBars = false
        
        presenter?.viewDidLoad()
        doctorsView.setPresenter(presenter: presenter)
    }
    
    override func loadView() {
        view = doctorsView
    }
}

extension DoctorsViewController: IDoctorsView {
    func display(viewModel: [DoctorsEntity]) {
        doctorsView.display(viewModel: viewModel)
    }
}
