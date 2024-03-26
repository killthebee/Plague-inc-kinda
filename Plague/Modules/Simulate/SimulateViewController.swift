import UIKit

class SimulateViewController: UIViewController, SimulateViewProtocol {
        
    var presenter: SimulatePresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
//        disableAutoresizing()
//        addSubviews()
//        configureLayout()
    }
}

