import UIKit

class SettingViewController: UIViewController {
    
    let mainView = SettingView()

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        setupView()
        mainView.setButton.addTarget(self, action: #selector(setButton), for: .allEvents)
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
    
    @objc func setButton() {
        dismiss(animated: true)
    }

}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SettingsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCellReuse", for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setup(settings[indexPath.row][0],settings[indexPath.row][1],settings[indexPath.row][2])
        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Settings"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .black
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
