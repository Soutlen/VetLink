
import Foundation

protocol IDoctorsInteractorOutput: AnyObject {
    func didFetchDoctros(doctors: [Doctor])
    func didFetchErrorDoctors(error: Error)
}

protocol IDoctorsPresenterInput: AnyObject {
    func viewDidLoad()
    func didSelectDoctor(at index: Int)
}

final class DoctorsPresenter {
    private let interactor: IDoctorsInteractorInput
    private weak var view: IDoctorsView?
    private let router: IDoctorsRouter?
    
    private var doctors: [Doctor] = []
    
    init(interactor: IDoctorsInteractorInput, view: IDoctorsView, router: IDoctorsRouter) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func didFetchDoctorsForUI(doctors: [Doctor]) {
        self.doctors = doctors
        let doctorDisplayItem = doctors.map {
            DoctorsEntity(
                id: $0.id,
                name: $0.name,
                specialty: $0.specialty,
                avatar: $0.photoUrl
            )
        }
        view?.display(viewModel: doctorDisplayItem)
    }
}

extension DoctorsPresenter: IDoctorsPresenterInput {
   
    func viewDidLoad() {
        self.interactor.fetchDoctors()
    }

    func didSelectDoctor(at index: Int) {
        guard index >= 0 && index < doctors.count else { return }
        
        let selectedDoctor = doctors[index]
        
        let detailDisplayItem = DoctorsDetailEntity(
            id: selectedDoctor.id,
            name: selectedDoctor.name,
            specialty: selectedDoctor.specialty,
            photoUrl: selectedDoctor.photoUrl,
            price: selectedDoctor.price,
            experience: selectedDoctor.expirience,
            rating: selectedDoctor.rating,
            description: selectedDoctor.description
        )
        
        router?.showDoctorDetail(with: detailDisplayItem)
    }
}

extension DoctorsPresenter: IDoctorsInteractorOutput {
    func didFetchDoctros(doctors: [Doctor]) {
        didFetchDoctorsForUI(doctors: doctors)
    }
    
    func didFetchErrorDoctors(error: any Error) {
        print(" Ошибка загрузки докторов: \(error.localizedDescription)")
    }
}

extension DoctorsPresenter: IDoctorsCollectionDelegate {
    func didSelectDoctors(at index: Int) {
        didSelectDoctor(at: index)
    }
}
