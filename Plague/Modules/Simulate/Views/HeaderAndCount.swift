import UIKit

class HeaderAndCountView: UIView {
    
    private let countContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = mainDarkerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    private let headerLable: UILabel = {
        let lable = UILabel()
        lable.text = headerCellString
        lable.font = title2Font
        lable.textColor = brownishColor
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    
//    private let healthyIcon = UI
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [countContainerView, headerLable
        ].forEach{addSubview($0)}
        
        let constraints: [NSLayoutConstraint] = [
            headerLable.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            headerLable.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            headerLable.topAnchor.constraint(
                equalTo: topAnchor
            ),
            headerLable.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            
            countContainerView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            countContainerView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            countContainerView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            countContainerView.widthAnchor.constraint(equalToConstant: 150),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
