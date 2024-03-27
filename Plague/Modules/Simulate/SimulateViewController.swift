import UIKit

class SimulateViewController: UIViewController, SimulateViewProtocol {
    
    // MARK: Dependencies -
    var presenter: SimulatePresenterProtocol?
    
    // MARK: Data -
    var rows: Int?
    var lastRow: Int?
    var infected = Set<Coord>()
    var population = 0
    
    // MARK: Logic -
    func makeGrid(_ population: Int) {
        self.population = population
        updateCounts()
        presenter?.makeGrid(population)
    }
    
    func startInfectionTast(_ timeOfOneTick: Int) {
        presenter?.fireInfectTask(timeOfOneTick)
    }
    
    func setSpredSpeed(_ infectionSpredSpeed: Int) {
        presenter?.setSpredSpeed(infectionSpredSpeed)
    }
    
    func updateGrid() {
        collectionView.reloadData()
    }
    
    func updateCounts() {
        healthyLable.text = makeCount(population - infected.count)
        illLable.text = makeCount(infected.count)
    }
    
    // MARK: UI Elements -
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout.init()
        )
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        collectionView.register(
            HumanCell.self,
            forCellWithReuseIdentifier: HumanCell.identifier
        )
        
        return collectionView
    }()
    
    private let countContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = mainDarkerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    private let healthyIconView = UIImageView(
        image: UIImage(named: "healthyIcon")
    )
    
    private let healthyLable: UILabel = {
        let lable = UILabel()
        lable.font = title2Font
        lable.text = "999"
        lable.textColor = brownishColor
        lable.textAlignment = .center
        
        return lable
    }()
    
    private let illIconView = UIImageView(
        image: UIImage(named: "illIcon")
    )
    
    private let illLable: UILabel = {
        let lable = UILabel()
        lable.font = title2Font
        lable.text = "999"
        lable.textColor = brownishColor
        
        return lable
    }()
    
    // MARK: VC Setup -
    override func viewDidLoad() {
        super.viewDidLoad()
        disableAutoresizing()
        addSubviews()
        configureLayout()
        configureCompositionalLayout()
    }
    
    private func disableAutoresizing() {
        [backgroundImage, collectionView, countContainerView, healthyIconView,
         healthyLable, illIconView, illLable
        ].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    private func addSubviews() {
        [backgroundImage, collectionView, countContainerView
        ].forEach{view.addSubview($0)}
        [healthyIconView, healthyLable, illIconView, illLable
        ].forEach{countContainerView.addSubview($0)}
    }
    
    // MARK: Layout - 
    private func configureLayout() {
        let constraints: [NSLayoutConstraint] = [
            backgroundImage.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            backgroundImage.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            backgroundImage.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            backgroundImage.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            
            countContainerView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -50
            ),
            countContainerView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            countContainerView.widthAnchor.constraint(
                equalToConstant: 140
            ),
            countContainerView.heightAnchor.constraint(
                equalToConstant: 32
            ),
            
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            collectionView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            
            healthyIconView.topAnchor.constraint(
                equalTo: countContainerView.topAnchor
            ),
            healthyIconView.leadingAnchor.constraint(
                equalTo: countContainerView.leadingAnchor
            ),
            healthyIconView.widthAnchor.constraint(
                equalToConstant: 32
            ),
            healthyIconView.heightAnchor.constraint(
                equalToConstant: 32
            ),
            
            healthyLable.topAnchor.constraint(
                equalTo: countContainerView.topAnchor
            ),
            healthyLable.leadingAnchor.constraint(
                equalTo: healthyIconView.trailingAnchor
            ),
            healthyLable.widthAnchor.constraint(
                equalToConstant: 35
            ),
            healthyLable.bottomAnchor.constraint(
                equalTo: countContainerView.bottomAnchor
            ),
            
            illIconView.topAnchor.constraint(
                equalTo: countContainerView.topAnchor
            ),
            illIconView.leadingAnchor.constraint(
                equalTo: healthyLable.trailingAnchor
            ),
            illIconView.widthAnchor.constraint(
                equalToConstant: 32
            ),
            illIconView.heightAnchor.constraint(
                equalToConstant: 32
            ),
            
            illLable.topAnchor.constraint(
                equalTo: countContainerView.topAnchor
            ),
            illLable.leadingAnchor.constraint(
                equalTo: illIconView.trailingAnchor
            ),
            illLable.widthAnchor.constraint(
                equalToConstant: 35
            ),
            illLable.bottomAnchor.constraint(
                equalTo: countContainerView.bottomAnchor
            ),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension SimulateViewController {
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            SimulateVCLayouts.shared.humanLayouts()
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

