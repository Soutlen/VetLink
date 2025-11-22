
import UIKit

protocol IDoctorsCollectionDelegate: AnyObject {
    func didSelectDoctors(at index: Int)
}

final class DoctorsCollectionDelegate: NSObject {
    weak var output: IDoctorsCollectionDelegate?
}

extension DoctorsCollectionDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.didSelectDoctors(at: indexPath.item)
    }
}
