class SimulateInteractor: SimulateInteractorProtocol {
    
    weak var presenter: SimulatePresenterProtocol?
        
    required init(
        presenter: SimulatePresenterProtocol
    ) {
        self.presenter = presenter
    }
}
