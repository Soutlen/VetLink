import Foundation

protocol IAppointmentsPresenterInput: AnyObject {
    func viewDidLoad()
    func didDeleteAppointment(at index: Int)
}

final class AppointmentsPresenter {
    private let interactor: IAppointmentsInteractorInput
    private weak var view: IAppointmentsView?
    
    private var appointments: [Appointment] = []
    
    init(interactor: IAppointmentsInteractorInput, view: IAppointmentsView) {
        self.interactor = interactor
        self.view = view
    }
    
    private func didFetchAppointmentsForUI(appointments: [Appointment]) {
        let sortedAppointments = appointments.sorted { $0.appointmentDate > $1.appointmentDate }
        self.appointments = sortedAppointments
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let displayItems = sortedAppointments.map {
            AppointmentsEntity(
                id: $0.id,
                doctorName: $0.doctorName,
                doctorSpecialty: $0.doctorSpecialty,
                date: dateFormatter.string(from: $0.appointmentDate),
                time: $0.appointmentTime
            )
        }
        
        view?.display(viewModel: displayItems)
    }
}

extension AppointmentsPresenter: IAppointmentsPresenterInput {
    
    func viewDidLoad() {
        interactor.fetchAppointments()
    }
    
    func didDeleteAppointment(at index: Int) {
        guard index >= 0 && index < appointments.count else { return }
        let appointment = appointments[index]
    }
}

extension AppointmentsPresenter: IAppointmentsInteractorOutput {
    
    func didFetchAppointments(appointments: [Appointment]) {
        didFetchAppointmentsForUI(appointments: appointments)
    }
    
    func didFetchErrorAppointments(error: Error) {
        print("Ошибка загрузки записей: \(error.localizedDescription)")
    }
}

