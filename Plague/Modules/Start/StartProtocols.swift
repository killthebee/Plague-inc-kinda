protocol StartViewProtocol: AnyObject {
    var presenter: StartPresenterProtocol? { get }
}

protocol StartConfiguratorProtocol: AnyObject {
    func configure(with viewController: StartViewController)
}

protocol StartPresenterProtocol: AnyObject {
    var router: StartRouterProtocol? { get }
}

protocol StartRouterProtocol: AnyObject {
}

protocol StartInteractorProtocol: AnyObject {
}
