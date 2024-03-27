import Foundation

class SimulateInteractor: SimulateInteractorProtocol {
    
    weak var presenter: SimulatePresenterProtocol?
    
    var infected = Set<Coord>()
    var lastRow: Int = 0
    var rows: Int = 0
    var infectionSpredSpeed: Int = 0
    
    var InfectTaskTimer: Timer?
        
    required init(
        presenter: SimulatePresenterProtocol
    ) {
        self.presenter = presenter
    }
    
    func makeGrid(_ population: Int) {
        presenter?.setGridParams(
            Int(population / 7),
            population % 7
        )
    }

    func addInfected(_ coord: Coord) {
        infected.insert(coord)
        updateInfected()
    }
    
    func updateInfected() {
        presenter?.updateInfected(infected)
    }
    
    func startInfectTask(_ interval: Double) {
        InfectTaskTimer = Timer.scheduledTimer(
            withTimeInterval: interval,
            repeats: true
        ) { _ in
            Task {
                await self.getNewlyInfected()
                self.presenter?.updateInfected(self.infected)
                await self.presenter?.updateGrid()
            }
        }
        
        InfectTaskTimer?.fire()
    }
    
    func getNewlyInfected() async { // <3 df
        for infectedCoord in infected {
            var possibleNewCoords: [Coord] = []
            let row = infectedCoord.row
            let column = infectedCoord.column
            
            let newCoord1 = Coord(row: row, column: column + 1)
            let newCoord2 = Coord(row: row - 1, column: column + 1)
            let newCoord3 = Coord(row: row - 1, column: column)
            let newCoord4 = Coord(row: row - 1, column: column - 1)
            let newCoord5 = Coord(row: row, column: column - 1)
            let newCoord6 = Coord(row: row + 1, column: column - 1)
            let newCoord7 = Coord(row: row + 1, column: column)
            let newCoord8 = Coord(row: row + 1, column: column + 1)
            
            if isNewCoordPossible(newCoord1) {
                possibleNewCoords.append(newCoord1)
            }
            if isNewCoordPossible(newCoord2) {
                possibleNewCoords.append(newCoord2)
            }
            if isNewCoordPossible(newCoord3) {
                possibleNewCoords.append(newCoord3)
            }
            if isNewCoordPossible(newCoord4) {
                possibleNewCoords.append(newCoord4)
            }
            if isNewCoordPossible(newCoord5) {
                possibleNewCoords.append(newCoord5)
            }
            if isNewCoordPossible(newCoord6) {
                possibleNewCoords.append(newCoord6)
            }
            if isNewCoordPossible(newCoord7) {
                possibleNewCoords.append(newCoord7)
            }
            if isNewCoordPossible(newCoord8) {
                possibleNewCoords.append(newCoord8)
            }
            
            let newCoords: [Coord]!
            if possibleNewCoords.count <= infectionSpredSpeed {
                newCoords = possibleNewCoords
            } else {
                newCoords = possibleNewCoords[randomPick: infectionSpredSpeed]
            }
            
            for coord in newCoords {
                infected.insert(coord)
            }
        }
        
        
    }
    
    private func isNewCoordPossible(_ coord: Coord) -> Bool {
        let row = coord.row
        let column = coord.column
        let notNegative = row >= 0 && column >= 0
        let notTooBig: Bool!
        if row == rows {
            notTooBig = column < lastRow
        } else {
            notTooBig = row < rows && coord.column < 7
        }
        let notInfected = !infected.contains(coord)
        
        return notTooBig && notNegative && notInfected
    }
}

struct Coord: Hashable {
    let row: Int
    let column: Int
}
