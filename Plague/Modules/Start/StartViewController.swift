import UIKit

class StartViewController: UIViewController, StartViewProtocol {
    
    var presenter: StartPresenterProtocol?
    
    @objc
    private func buttonPressed(_ sender: UIButton) {
        sender.startAnimatingPressActions()
        presenter?.presentSimulate()
    }
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let centerContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = mainColor
        view.alpha = 0.8
        
        return view
    }()
    
    private let sizeLable: UILabel = {
        let lable = UILabel()
        lable.font = title3Font
        lable.textColor = brownishColor
        lable.text = sizeString
        lable.sizeToFit()
        
        return lable
    }()
    
    private let factorLable: UILabel = {
        let lable = UILabel()
        lable.font = title3Font
        lable.textColor = brownishColor
        lable.text = factorString
        
        return lable
    }()
    
    private let intervalLable: UILabel = {
        let lable = UILabel()
        lable.font = title3Font
        lable.textColor = brownishColor
        lable.text = intervalString
        
        return lable
    }()
    
    private lazy var sizeTextField: InputField = {
        let field = InputField(tag: 1, "10")
        field.delegate = self
        
        return field
    }()
    
    private lazy var factorTextField: InputField = {
        let field = InputField(tag: 2, "3")
        field.delegate = self
        
        return field
    }()
    
    private lazy var intervalTextField: InputField = {
        let field = InputField(tag: 3, "2")
        field.delegate = self
        
        return field
    }()
    
    private lazy var simulateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = mainDarkerColor
        button.setTitle(simulateString, for: .normal)
        button.setTitleColor(brownishColor, for: .normal)
        button.titleLabel?.font = title2Font
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchDown
        )
        
        return button
    }()
    
    private let headerLable: UILabel = {
        let lable = UILabel()
        lable.text = headerString
        lable.font = title2Font
        lable.textColor = brownishColor
        lable.textAlignment = .center
        
        return lable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        disableAutoresizing()
        addSubviews()
        configureLayout()
    }

    private func addSubviews() {
        [backgroundImage, centerContainerView,
        ].forEach{view.addSubview($0)}
        [headerLable, paramsContainerView, simulateButton
        ].forEach{centerContainerView.addSubview($0)}
        [sizeLable, factorLable, intervalLable, sizeTextField, factorTextField,
         intervalTextField,
        ].forEach{paramsContainerView.addSubview($0)}
    }
    
    private func disableAutoresizing() {
        [backgroundImage, centerContainerView,
         sizeLable, factorLable, intervalLable, paramsContainerView,
         sizeTextField,factorTextField, intervalTextField, simulateButton,
         headerLable,
        ].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    private let paramsContainerView = UIView()
    
    private func configureLayout() {
        let spacing1: CGFloat = 8
        let spacing2: CGFloat = 16
        let lableSizing: CGFloat = 25
        let fieldWidth: CGFloat = 32
        let paramsHeight: CGFloat = 3 * lableSizing + 2 * spacing1
        let containerHeight: CGFloat = (paramsHeight + 2 * spacing1
            + 2 * spacing2 + lableSizing + 40)
        
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
            
            centerContainerView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            centerContainerView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            centerContainerView.heightAnchor.constraint(
                equalToConstant: containerHeight
            ),
            centerContainerView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.9
            ),
            
            headerLable.topAnchor.constraint(
                equalTo: centerContainerView.topAnchor,
                constant: spacing1
            ),
            headerLable.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            headerLable.leadingAnchor.constraint(
                equalTo: centerContainerView.leadingAnchor
            ),
            headerLable.trailingAnchor.constraint(
                equalTo: centerContainerView.trailingAnchor
            ),
            
            paramsContainerView.topAnchor.constraint(
                equalTo: headerLable.bottomAnchor,
                constant: spacing2
            ),
            paramsContainerView.heightAnchor.constraint(
                equalToConstant: paramsHeight
            ),
            paramsContainerView.leadingAnchor.constraint(
                equalTo: centerContainerView.leadingAnchor,
                constant: spacing2
            ),
            paramsContainerView.trailingAnchor.constraint(
                equalTo: centerContainerView.trailingAnchor,
                constant: -1 * spacing2
            ),
            
            sizeLable.topAnchor.constraint(
                equalTo: paramsContainerView.topAnchor
            ),
            sizeLable.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            sizeLable.leadingAnchor.constraint(
                equalTo: paramsContainerView.leadingAnchor
            ),
            sizeLable.widthAnchor.constraint(
                equalTo: paramsContainerView.widthAnchor,
                multiplier: 0.5
            ),
            
            factorLable.topAnchor.constraint(
                equalTo: sizeLable.bottomAnchor,
                constant: spacing1
            ),
            factorLable.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            factorLable.leadingAnchor.constraint(
                equalTo: paramsContainerView.leadingAnchor
            ),
            factorLable.widthAnchor.constraint(
                equalTo: paramsContainerView.widthAnchor,
                multiplier: 0.5
            ),
            
            intervalLable.topAnchor.constraint(
                equalTo: factorLable.bottomAnchor,
                constant: spacing1
            ),
            intervalLable.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            intervalLable.leadingAnchor.constraint(
                equalTo: paramsContainerView.leadingAnchor
            ),
            intervalLable.widthAnchor.constraint(
                equalTo: paramsContainerView.widthAnchor,
                multiplier: 0.5
            ),
            
            sizeTextField.topAnchor.constraint(
                equalTo: paramsContainerView.topAnchor
            ),
            sizeTextField.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            sizeTextField.trailingAnchor.constraint(
                equalTo: paramsContainerView.trailingAnchor
            ),
            sizeTextField.widthAnchor.constraint(
                equalToConstant: fieldWidth
            ),
            
            factorTextField.topAnchor.constraint(
                equalTo: factorLable.topAnchor
            ),
            factorTextField.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            factorTextField.trailingAnchor.constraint(
                equalTo: paramsContainerView.trailingAnchor
            ),
            factorTextField.widthAnchor.constraint(
                equalToConstant: fieldWidth
            ),
            
            intervalTextField.topAnchor.constraint(
                equalTo: intervalLable.topAnchor
            ),
            intervalTextField.heightAnchor.constraint(
                equalToConstant: lableSizing
            ),
            intervalTextField.trailingAnchor.constraint(
                equalTo: paramsContainerView.trailingAnchor
            ),
            intervalTextField.widthAnchor.constraint(
                equalToConstant: fieldWidth
            ),
            
            simulateButton.centerXAnchor.constraint(
                equalTo: centerContainerView.centerXAnchor
            ),
            simulateButton.topAnchor.constraint(
                equalTo: paramsContainerView.bottomAnchor,
                constant: spacing2
            ),
            simulateButton.heightAnchor.constraint(
                equalToConstant: 32
            ),
            simulateButton.widthAnchor.constraint(
                equalToConstant: 250
            ),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        simulateButton.startAnimatingPressActions()
        simulateButton.dropShadow()
    }
}

