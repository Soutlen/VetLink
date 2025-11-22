import Foundation

protocol IDoctorsDetailPresenterInput: AnyObject {
    func viewDidLoad()
}

protocol IDoctorsDetailViewInput: AnyObject {
    func display(viewModel: DoctorsDetailEntity)
}

final class DoctorsDetailPresenter {
    
    private weak var view: IDoctorsDetailViewInput?
    private let viewModel: DoctorsDetailEntity
    
    init(viewModel: DoctorsDetailEntity) {
        self.viewModel = viewModel
    }
  
    func configureView(view: IDoctorsDetailViewInput) {
        self.view = view
    }
}

extension DoctorsDetailPresenter: IDoctorsDetailPresenterInput {
    
    func viewDidLoad() {
        view?.display(viewModel: viewModel)
    }
}
