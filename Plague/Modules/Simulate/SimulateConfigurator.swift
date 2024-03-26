class SimaulateConfigurator: SimulateConfiguratorProtocol {
    
    private let assembly: AppAssembly
    
    init(assembly: AppAssembly) {
        self.assembly = assembly
    }
    
    func configure(with viewController: SimulateViewController) {
        let presenter = SimulatePresenter(view: viewController)
        let router = SimulateRouter(assembly: assembly, view: viewController)
        let interactor = SimulateInteractor(presenter: presenter)
////
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
