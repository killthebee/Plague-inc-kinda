protocol StartViewProtocol: AnyObject {
    var presenter: StartPresenterProtocol? { get }
}

protocol StartConfiguratorProtocol: AnyObject {
    func configure(with viewController: StartViewController)
}

protocol StartPresenterProtocol: AnyObject {
    var router: StartRouterProtocol? { get }
    func presentSimulate()
}

protocol StartRouterProtocol: AnyObject {
    func presentSimulate()
}

protocol StartInteractorProtocol: AnyObject {
}
