
import UIKit

protocol IDoctorsView: AnyObject {
    func display(viewModel: [DoctorsEntity])
}

final class DoctorsView: UIView {
    
    private let collectionDataSource = DoctorsCollectionDataSource()
    private let collectionDelegate = DoctorsCollectionDelegate()
    
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width - 24,
            height: 350
        )
        
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 12,
            bottom: 16,
            right: 12
        )
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DoctorsCell.self, forCellWithReuseIdentifier: DoctorsCell.identifier)
        collectionView.delegate = collectionDelegate
        collectionView.dataSource = collectionDataSource
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .automatic
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPresenter(presenter: IDoctorsPresenterInput?) {
        if let delegate = presenter as? IDoctorsCollectionDelegate {
            collectionDelegate.output = delegate
        }
    }
}

private extension DoctorsView {
    func setupView() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension DoctorsView: IDoctorsView {
    func display(viewModel: [DoctorsEntity]) {
        collectionDataSource.update(doctors: viewModel)
        collectionView.reloadData()
    }
}
