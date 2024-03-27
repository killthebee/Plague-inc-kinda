protocol SimulateViewProtocol: AnyObject {
    var presenter: SimulatePresenterProtocol? { get }
    var rows: Int? { get set }
    var lastRow: Int? { get set }
    var infected: Set<Coord> { get set }
    func updateGrid()
}

protocol SimulateConfiguratorProtocol: AnyObject {
    func configure(with viewController: SimulateViewController)
}

protocol SimulatePresenterProtocol: AnyObject {
    var router: SimulateRouterProtocol? { get }
    func humanInfected(_ row: Int, _ column: Int)
    func makeGrid(_ population: Int)
    func setGridParams(_ rows: Int, _ lastRow: Int)
    func updateInfected(_ infected: Set<Coord>)
    func updateGrid() async
    func setSpredSpeed(_ infectionSpredSpeed: Int)
    func fireInfectTask(_ timeOfOneTick: Int)
}

protocol SimulateRouterProtocol: AnyObject {
}

protocol SimulateInteractorProtocol: AnyObject {
    var lastRow: Int { get set }
    var rows: Int { get set }
    func makeGrid(_ population: Int)
    func addInfected(_ coord: Coord)
    var infectionSpredSpeed: Int { get set }
    func startInfectTask(_ interval: Double)
}
