

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
        Task {
            do {
                let doctors = try await model.getAllDoctors()
                await MainActor.run {
                    output?.didFetchDoctros(doctors: doctors)
                }
            } catch {
                await MainActor.run {
                    output?.didFetchErrorDoctors(error: error)
                }
            }
        }
    }
}
