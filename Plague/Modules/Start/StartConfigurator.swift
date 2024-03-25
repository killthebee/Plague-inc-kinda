class StartConfigurator: StartConfiguratorProtocol {
    
    private let assembly: AppAssembly
    
    init(assembly: AppAssembly) {
        self.assembly = assembly
    }
    
    func configure(with viewController: StartViewController) {
        let presenter = StartPresenter(view: viewController)
        let router = StartRouter(assembly: assembly, view: viewController)
        let interactor = StartInteractor(presenter: presenter)
//
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
