class StartRouter:  StartRouterProtocol {

    weak var view: Presentable?
    private let assembly: AppAssembly
    
    init(assembly: AppAssembly, view: Presentable) {
        self.assembly = assembly
        self.view = view
    }
    
    func presentSimulate(
        _ population: Int,
        _ infectionSpredSpeed: Int,
        _ timeOfOneTick: Int
    ) {
        guard
            let simulateVC = assembly.makeSimulateScreen() as? SimulateViewController
        else {
            return
        }
        simulateVC.makeGrid(population)
        simulateVC.startInfectionTast(timeOfOneTick)
        simulateVC.setSpredSpeed(infectionSpredSpeed)
        
        simulateVC.modalPresentationStyle = .fullScreen
        simulateVC.modalTransitionStyle = .crossDissolve
        view?.present(simulateVC)
    }
}
