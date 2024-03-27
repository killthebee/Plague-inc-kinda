import UIKit

class HumanCell: UICollectionViewCell {
    
    static let identifier = "HumanCellIdentifier"
    
    func configure(_ isInfected: Bool) {
        if isInfected { markAsInfected() } else { markAsHealthy() }
    }
    
    func markAsInfected() {
        coverView.image = UIImage(named: "illIcon")
    }
    
    func markAsHealthy() {
        coverView.image = UIImage(named: "healthyIcon")
    }
    
    private let coverView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "healthyIcon")
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        contentView.addSubview(coverView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: coverView.topAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: coverView.bottomAnchor
            ),
            contentView.leadingAnchor.constraint(
                equalTo: coverView.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: coverView.trailingAnchor
            )
        ])
    }
}
