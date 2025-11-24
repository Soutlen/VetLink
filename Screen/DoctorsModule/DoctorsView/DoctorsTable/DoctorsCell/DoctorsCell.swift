import UIKit
import Supabase

final class DoctorsCell: UICollectionViewCell {
    
    static let identifier = "DoctorsCell"
    
    private let viewContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specialtyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImage.image = nil
        nameLabel.text = nil
        specialtyLabel.text = nil
    }
    
    func configure(with item: DoctorsEntity) {
        nameLabel.text = item.name
        specialtyLabel.text = item.specialty
        avatarImage.image = nil
        loadImage(from: item.avatar)
    }
    
    private func loadImage(from fileName: String) {
        guard !fileName.isEmpty else {
            avatarImage.image = UIImage(systemName: Constants.Images.placeholderPerson)
            return
        }
        
        let fullURL = ImageURLHelper.makeImageURL(fileName: fileName)
        
        ImageCacheManager.shared.getImage(from: fullURL) { [weak self] image in
            DispatchQueue.main.async {
                if let image = image {
                    self?.avatarImage.image = image
                } else {
                    self?.avatarImage.image = UIImage(systemName: Constants.Images.placeholderPerson)
                }
            }
        }
    }
    
    private func setupAppearance() {
        backgroundColor = .clear
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = Constants.UI.cornerRadius
        contentView.layer.masksToBounds = true
    }
}

private extension DoctorsCell {
    func setupLayout() {
        setupViewContent()
        setupImage()
        setupLabel()
    }
    
    func setupViewContent() {
        contentView.addSubview(viewContent)
        
        NSLayoutConstraint.activate([
            viewContent.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupImage() {
        viewContent.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: viewContent.topAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor),
            avatarImage.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        avatarImage.layer.cornerRadius = 16
        avatarImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        avatarImage.clipsToBounds = true
    }
    
    func setupLabel() {
        viewContent.addSubview(nameLabel)
        viewContent.addSubview(specialtyLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -16),
            
            specialtyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            specialtyLabel.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 16),
            specialtyLabel.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -16),
            specialtyLabel.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -12)
        ])
    }
}
