import UIKit

final class AppointmentsViewController: UIViewController {
    
    private let appointmentsView = AppointmentsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Записи"
    }
    
    override func loadView() {
        view = appointmentsView
    }
}
