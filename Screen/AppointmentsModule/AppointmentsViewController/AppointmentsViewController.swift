
import UIKit

final class AppointmentsViewController: UIViewController {
    
    var presenter: IAppointmentsPresenterInput?
    private let appointmentsView = AppointmentsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Записи"
        
        presenter?.viewDidLoad()
        appointmentsView.configure(presenter: presenter)
    }
    
    override func loadView() {
        view = appointmentsView
    }
}

extension AppointmentsViewController: IAppointmentsView {
    func display(viewModel: [AppointmentsEntity]) {
        appointmentsView.display(viewModel: viewModel)
    }
}
