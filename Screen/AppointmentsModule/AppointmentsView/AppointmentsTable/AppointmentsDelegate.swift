import UIKit

protocol IAppointmentsDelegate: AnyObject {
    func didSelectAppointment(at index: Int)
}

final class AppointmentsDelegate: NSObject {
    
    weak var output: IAppointmentsDelegate?
}

extension AppointmentsDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelectAppointment(at: indexPath.row)
    }
}
