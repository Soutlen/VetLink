import UIKit

/// Протокол для передачи данных от Presenter к View
protocol IDoctorsDetailView: AnyObject {
    /// Отобразить детальную информацию о докторе
    /// - Parameter viewModel: DoctorsDetailEntity с данными доктора для отображения
    func display(viewModel: DoctorsDetailEntity)
}

final class DoctorsDetailView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 24
        return image
    }()
    
    private let specialtyContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let specialtyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let experienceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    private let actionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let actionViewSystemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cross.case.fill")
        imageView.tintColor = .black.withAlphaComponent(0.4)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleActionViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Консультация"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DoctorsDetailView {
    
    func setupLayout() {
        setupScrollView()
        setupImage()
        setupSpecialty()
        setupName()
        setupDescription()
        setupActionView()
    }
    
    func setupScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupImage() {
        contentView.addSubview(avatarImage)
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            avatarImage.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func setupSpecialty() {
        contentView.addSubview(specialtyContainerView)
        specialtyContainerView.addSubview(specialtyLabel)
        
        specialtyContainerView.translatesAutoresizingMaskIntoConstraints = false
        specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            specialtyContainerView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            specialtyContainerView.heightAnchor.constraint(equalToConstant: 32),
            specialtyContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            specialtyContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            specialtyLabel.topAnchor.constraint(equalTo: specialtyContainerView.topAnchor, constant: 8),
            specialtyLabel.leadingAnchor.constraint(equalTo: specialtyContainerView.leadingAnchor, constant: 16),
            specialtyLabel.trailingAnchor.constraint(equalTo: specialtyContainerView.trailingAnchor, constant: -16),
            specialtyLabel.bottomAnchor.constraint(equalTo: specialtyContainerView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupName() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(experienceLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: specialtyContainerView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            experienceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            experienceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            experienceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupDescription() {
        contentView.addSubview(descriptionContainerView)
        descriptionContainerView.addSubview(descriptionLabel)
        
        descriptionContainerView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionContainerView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 24),
            descriptionContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContainerView.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainerView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionContainerView.bottomAnchor, constant: -16)
        ])
    }
    
    func setupActionView() {
        contentView.addSubview(actionView)
        
        actionView.addSubview(actionViewSystemImage)
        actionView.addSubview(titleActionViewLabel)
        actionView.addSubview(priceLabel)
        
        actionView.translatesAutoresizingMaskIntoConstraints = false
        actionViewSystemImage.translatesAutoresizingMaskIntoConstraints = false
        titleActionViewLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionView.topAnchor.constraint(equalTo: descriptionContainerView.bottomAnchor, constant: 24),
            actionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            actionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            actionView.heightAnchor.constraint(equalToConstant: 80),
            actionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            actionViewSystemImage.leadingAnchor.constraint(equalTo: actionView.leadingAnchor, constant: 16),
            actionViewSystemImage.centerYAnchor.constraint(equalTo: actionView.centerYAnchor),
            actionViewSystemImage.widthAnchor.constraint(equalToConstant: 48),
            actionViewSystemImage.heightAnchor.constraint(equalToConstant: 48),
            
            titleActionViewLabel.leadingAnchor.constraint(equalTo: actionViewSystemImage.trailingAnchor, constant: 16),
            titleActionViewLabel.trailingAnchor.constraint(lessThanOrEqualTo: actionView.trailingAnchor, constant: -16),
            titleActionViewLabel.topAnchor.constraint(equalTo: actionView.topAnchor, constant: 20),
            
            priceLabel.leadingAnchor.constraint(equalTo: actionViewSystemImage.trailingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: actionView.trailingAnchor, constant: -16),
            priceLabel.topAnchor.constraint(equalTo: titleActionViewLabel.bottomAnchor, constant: 8),
            priceLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}

extension DoctorsDetailView {

    func configure(with doctor: DoctorsDetailEntity) {
        nameLabel.text = doctor.name
        specialtyLabel.text = doctor.specialty
        experienceLabel.text = "Опыт: \(doctor.experience)"
        descriptionLabel.text = doctor.description
        priceLabel.text = "\(doctor.price) ₽"
        loadImage(fileName: doctor.photoUrl)
    }
    
    private func loadImage(fileName: String) {
        guard !fileName.isEmpty else {
            avatarImage.image = UIImage(systemName: Constants.Images.placeholderPerson)
            return
        }
        
        let fullURL = ImageURLHelper.makeImageURL(fileName: fileName)
        
        Task {
            if let image = await ImageCacheManager.shared.getImage(from: fullURL, fileName: fileName) {
                await MainActor.run {
                    avatarImage.image = image
                }
            } else {
                await MainActor.run {
                    avatarImage.image = UIImage(systemName: Constants.Images.placeholderPerson)
                }
            }
        }
    }
}

extension DoctorsDetailView: IDoctorsDetailView {
    func display(viewModel: DoctorsDetailEntity) {
        configure(with: viewModel)
    }
}
