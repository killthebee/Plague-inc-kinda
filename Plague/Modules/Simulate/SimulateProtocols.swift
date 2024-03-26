protocol SimulateViewProtocol: AnyObject {
    var presenter: SimulatePresenterProtocol? { get }
}

protocol SimulateConfiguratorProtocol: AnyObject {
    func configure(with viewController: SimulateViewController)
}

protocol SimulatePresenterProtocol: AnyObject {
    var router: SimulateRouterProtocol? { get }
}

protocol SimulateRouterProtocol: AnyObject {
}

protocol SimulateInteractorProtocol: AnyObject {
}
