import UIKit

class SimulatePresenter: SimulatePresenterProtocol {
    
    weak var view: SimulateViewProtocol?
    var interactor: SimulateInteractorProtocol?
    var router: SimulateRouterProtocol?
    
    required init(view: SimulateViewProtocol) {
        self.view = view
    }
}
