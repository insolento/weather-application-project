import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpGeo()

        setupView()
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
    
    func popUpGeo() {
        let vC = GeoViewController()
        vC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vC, animated: true)
    }
}
