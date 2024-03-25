import UIKit

class AppAssembly {}

// MARK: Start Screen -
extension AppAssembly {
    func makeMainScreen() -> Presentable {
        let startVC = StartViewController()
        let configurator = StartConfigurator(assembly: self)
        configurator.configure(with: startVC)
        
        return startVC
    }
}
