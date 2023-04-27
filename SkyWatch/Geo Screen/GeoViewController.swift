import UIKit

class GeoViewController: UIViewController {
    
    let mainView = GeoView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupView()
        setupButtons()
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
    
    func setupButtons() {
        mainView.useButton.addTarget(self, action: #selector(use), for: .allEvents)
        mainView.notUseButton.addTarget(self, action: #selector(notUse), for: .allEvents)
    }
    
    @objc func use() {
        dismiss(animated: true)
    }
    
    @objc func notUse() {
        dismiss(animated: true)
    }
}
