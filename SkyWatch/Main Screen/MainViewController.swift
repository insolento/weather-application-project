import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpGeo()

        setupView()
        collectionViewSetup()
        buttonsSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainView.mainWeatherView.circleCreation()
    }
    
    func collectionViewSetup() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.verticalCollectionView.delegate = self
        mainView.verticalCollectionView.dataSource = self
        mainView.verticalCollectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: "VerticalCellReuse")
        mainView.collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "HorizontalCellReuse")
    }
    
    func setupView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func buttonsSetup() {
        mainView.moreButton.addTarget(self, action: #selector(openMore), for: .touchDown)
        mainView.leftButton.addTarget(self, action: #selector(openSettings), for: .touchDown)
        mainView.rightButton.addTarget(self, action: #selector(openGeoloc), for: .touchDown)
    }
    
    func popUpGeo() {
        let vC = GeoViewController()
        vC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vC, animated: true)
    }
    
    @objc func openMore() {
        let vC = _24HViewController()
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @objc func openSettings() {
        let vC = SettingViewController()
        vC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vC, animated: true)
    }
    
    @objc func openGeoloc() {
        
    }
}



extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.mainView.collectionView {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mainView.collectionView {
            return 24
        } else {
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainView.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCellReuse", for: indexPath)
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 25
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalCellReuse", for: indexPath)
            cell.backgroundColor = .clear
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.mainView.collectionView {
                return CGSize(width: 50, height: 100)
            } else {
                return CGSize(width: view.bounds.width, height: 50)
            }
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            if collectionView == self.mainView.verticalCollectionView {
                let newController = DayViewController()
                navigationController?.pushViewController(newController, animated: true)
            }
        }
}
