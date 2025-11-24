import Foundation

protocol IDoctorsInteractorInput: AnyObject {
    var output: IDoctorsInteractorOutput? { get set }
    func fetchDoctors()
}

final class DoctorsInteractor {
    weak var output: IDoctorsInteractorOutput?
    private let model: IDoctorsModel
    
    init(model: IDoctorsModel) {
        self.model = model
    }
}

extension DoctorsInteractor: IDoctorsInteractorInput {
    
    func fetchDoctors() {
        model.getAllDoctors { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let doctors):
                    self?.output?.didFetchDoctros(doctors: doctors)
                case .failure(let error):
                    self?.output?.didFetchErrorDoctors(error: error)
                }
            }
        }
    }
}
