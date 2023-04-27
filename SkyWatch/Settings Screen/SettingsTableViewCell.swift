import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    private var settingNow: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["O1","O2"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        addSubviews()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ setting: String, _ value1: String, _ value2: String ) {
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: value1, at: 0, animated: true)
        segmentControl.insertSegment(withTitle: value2, at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 1
        settingNow.text = setting
    }
    
    func addSubviews() {
        contentView.addSubview(settingNow)
        contentView.addSubview(segmentControl)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            settingNow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            settingNow.topAnchor.constraint(equalTo: contentView.topAnchor),
            settingNow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            settingNow.widthAnchor.constraint(equalToConstant: 100),
            
            segmentControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            segmentControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            segmentControl.widthAnchor.constraint(equalToConstant: 100),
            
            contentView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

}
