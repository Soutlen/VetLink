
import UIKit

protocol IDoctorsCollectionDataSource: UICollectionViewDataSource {
    func update(doctors: [DoctorsEntity])
}

final class DoctorsCollectionDataSource: NSObject {
    private var doctors: [DoctorsEntity] = []
    
    func update(doctors: [DoctorsEntity]) {
        self.doctors = doctors
    }
}

extension DoctorsCollectionDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoctorsCell.identifier, for: indexPath) as! DoctorsCell
        cell.configure(with: doctors[indexPath.item]) 
        return cell
    }
}
