class StartInteractor: StartInteractorProtocol {
    
    weak var presenter: StartPresenterProtocol?
        
    required init(
        presenter: StartPresenterProtocol
    ) {
        self.presenter = presenter
    }
}
