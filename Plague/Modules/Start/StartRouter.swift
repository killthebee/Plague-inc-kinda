class StartRouter:  StartRouterProtocol {

    weak var view: Presentable?
    private let assembly: AppAssembly
    
    init(assembly: AppAssembly, view: Presentable) {
        self.assembly = assembly
        self.view = view
    }
    
    func presentSimulate() {
        guard
            let simulateVC = assembly.makeSimulateScreen() as? SimulateViewController
        else {
            return
        }
        
        simulateVC.modalPresentationStyle = .fullScreen
        view?.present(simulateVC)
    }
}
