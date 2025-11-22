import Foundation

protocol IAppointmentsInteractorOutput: AnyObject {
    func didFetchAppointments(appointments: [Appointment])
    func didFetchErrorAppointments(error: Error)
}

protocol IAppointmentsInteractorInput: AnyObject {
    var output: IAppointmentsInteractorOutput? { get set }
    func fetchAppointments()
}

final class AppointmentsInteractor {
    weak var output: IAppointmentsInteractorOutput?
    private let model: IAppointmentsModel
    
    init(model: IAppointmentsModel) {
        self.model = model
    }
}

extension AppointmentsInteractor: IAppointmentsInteractorInput {
    func fetchAppointments() {
        Task {
            do {
                let appointments = try await model.getAllAppointments()
                await MainActor.run {
                    output?.didFetchAppointments(appointments: appointments)
                }
            } catch {
                await MainActor.run {
                    output?.didFetchErrorAppointments(error: error)
                }
            }
        }
    }
}
