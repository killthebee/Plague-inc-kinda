import UIKit

class AppAssembly {}

// MARK: Start Screen -
extension AppAssembly {
    func makeStartScreen() -> Presentable {
        let startVC = StartViewController()
        let configurator = StartConfigurator(assembly: self)
        configurator.configure(with: startVC)
        
        return startVC
    }
}

// MARK: Simulate Screen -
extension AppAssembly {
    func makeSimulateScreen() -> Presentable {
        let simulateVC = SimulateViewController()
        let configurator = SimaulateConfigurator(assembly: self)
        configurator.configure(with: simulateVC)
        
        return simulateVC
    }
}
