
import UIKit

final class AppointmentCell: UITableViewCell {
    
    static let identifier = "AppointmentCell"
    
    private let doctorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specialtyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: AppointmentsEntity) {
        doctorNameLabel.text = item.doctorName
        specialtyLabel.text = item.doctorSpecialty
        dateTimeLabel.text = item.formattedDateTime
    }
}

private extension AppointmentCell {
    
    func setupLayout() {
        contentView.addSubview(doctorNameLabel)
        contentView.addSubview(specialtyLabel)
        contentView.addSubview(dateTimeLabel)
        
        NSLayoutConstraint.activate([
            doctorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            doctorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            doctorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            specialtyLabel.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 4),
            specialtyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            specialtyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dateTimeLabel.topAnchor.constraint(equalTo: specialtyLabel.bottomAnchor, constant: 8),
            dateTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
