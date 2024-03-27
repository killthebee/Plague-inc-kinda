import UIKit

class SimulatePresenter: SimulatePresenterProtocol {
    
    weak var view: SimulateViewProtocol?
    var interactor: SimulateInteractorProtocol?
    var router: SimulateRouterProtocol?
    
    required init(view: SimulateViewProtocol) {
        self.view = view
    }
    
    func humanInfected(_ row: Int, _ column: Int) {
        interactor?.addInfected(Coord(row: row, column: column))
    }
    
    func makeGrid(_ population: Int) {
        interactor?.makeGrid(population)
    }
    
    func setGridParams(_ rows: Int, _ lastRow: Int) {
        view?.rows = rows
        view?.lastRow = lastRow
        interactor?.lastRow = lastRow
        interactor?.rows = rows
    }
    
    func updateInfected(_ infected: Set<Coord>) {
        view?.infected = infected
    }
    
    @MainActor
    func updateGrid() async {
        view?.updateGrid()
        view?.updateCounts()
    }
    
    func setSpredSpeed(_ infectionSpredSpeed: Int) {
        interactor?.infectionSpredSpeed = infectionSpredSpeed
    }
    
    func fireInfectTask(_ timeOfOneTick: Int) {
        interactor?.startInfectTask(Double(timeOfOneTick))
    }
}
