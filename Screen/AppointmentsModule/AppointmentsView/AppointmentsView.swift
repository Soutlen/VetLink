
import UIKit

protocol IAppointmentsView: AnyObject {
    func display(viewModel: [AppointmentsEntity])
}

final class AppointmentsView: UIView {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(AppointmentCell.self, forCellReuseIdentifier: AppointmentCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let dataSource = AppointmentsDataSource()
    private let delegate = AppointmentsDelegate()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(presenter: IAppointmentsPresenterInput?) {
        if let delegate = presenter as? IAppointmentsDelegate {
            self.delegate.output = delegate
        }
    }
}

private extension AppointmentsView {
    
    func setupView() {
        backgroundColor = .systemGray5
        setupTableView()
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AppointmentsView: IAppointmentsView {
    func display(viewModel: [AppointmentsEntity]) {
        dataSource.update(appointments: viewModel)
        tableView.reloadData()
    }
}
