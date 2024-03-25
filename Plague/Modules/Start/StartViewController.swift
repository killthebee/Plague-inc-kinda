import UIKit

class StartViewController: UIViewController, StartViewProtocol {
    
    var presenter: StartPresenterProtocol?
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let centerContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        disableAutoresizing()
        addSubviews()
        configureLayout()
    }

    private func addSubviews() {
        [backgroundImage].forEach{view.addSubview($0)}
    }
    
    private func disableAutoresizing() {
        [backgroundImage,
        ].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    private func configureLayout() {
        let constraints: [NSLayoutConstraint] = [
            backgroundImage.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            backgroundImage.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            backgroundImage.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            backgroundImage.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

