protocol StartViewProtocol: AnyObject {
    var presenter: StartPresenterProtocol? { get }
}

protocol StartConfiguratorProtocol: AnyObject {
    func configure(with viewController: StartViewController)
}

protocol StartPresenterProtocol: AnyObject {
    var router: StartRouterProtocol? { get }
    func presentSimulate(
        _ size: String?,
        _ factor: String?,
        _ interval: String?
    )
}

protocol StartRouterProtocol: AnyObject {
    func presentSimulate(
        _ population: Int,
        _ infectionSpredSpeed: Int,
        _ timeOfOneTick: Int
    )
}

protocol StartInteractorProtocol: AnyObject {
}
