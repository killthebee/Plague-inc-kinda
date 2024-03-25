import UIKit

class StartPresenter: StartPresenterProtocol {
    weak var view: StartViewProtocol?
    var interactor: StartInteractorProtocol?
    var router: StartRouterProtocol?
    
    required init(view: StartViewProtocol) {
        self.view = view
    }
}
