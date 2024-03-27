import UIKit

class StartPresenter: StartPresenterProtocol {
    weak var view: StartViewProtocol?
    var interactor: StartInteractorProtocol?
    var router: StartRouterProtocol?
    
    required init(view: StartViewProtocol) {
        self.view = view
    }
    
    func presentSimulate(
        _ size: String?,
        _ factor: String?,
        _ interval: String?
    ) {
        guard
            let size = size,
            let factor = factor,
            let interval = interval
        else
            { return }
        
        let population: Int!
        if let size = Int(size) {
            population = size
        } else {
            population = 10
        }
        let infectionSpredSpeed: Int!
        if let factor = Int(factor) {
            infectionSpredSpeed = factor
        } else {
            infectionSpredSpeed = 3
        }
        let timeOfOneTick: Int!
        if let interval = Int(interval) {
            timeOfOneTick = interval
        } else {
            timeOfOneTick = 2
        }
        router?.presentSimulate(population, infectionSpredSpeed, timeOfOneTick)
    }
}
