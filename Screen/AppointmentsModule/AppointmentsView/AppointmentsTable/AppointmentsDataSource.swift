
import UIKit

protocol IAppointmentsDataSource: UITableViewDataSource {
    func update(appointments: [AppointmentsEntity])
}

final class AppointmentsDataSource: NSObject {
    
    private var appointments: [AppointmentsEntity] = []
    
    func update(appointments: [AppointmentsEntity]) {
        self.appointments = appointments
    }
}

extension AppointmentsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppointmentCell.identifier, for: indexPath) as! AppointmentCell
        cell.configure(with: appointments[indexPath.row])
        return cell
    }
}
