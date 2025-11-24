import UIKit

final class AppointmentsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AppointmentsView {
    
    func setupView() {
        backgroundColor = .systemBackground
    }
}
