import UIKit

class GeoView: UIView {
    
    let imageUmbrella : UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "Umbrella")?.cgImage
        return logoView
    }()

    let titleLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        text.textColor = .white
        text.text = """
        Allow the Weather app
         to use your device's
         location data
        """
        text.textAlignment = .center
        return text
    }()

    let subtitleLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 17, weight: .light)
        text.textColor = .white
        text.text = """
        To get more accurate weather
        forecasts while driving or traveling
        
        You can change your choice at
        any time from the application menu
        """
        text.textAlignment = .center
        return text
    }()
    
    let useButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Allow device geolocation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let notUseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Do not allow any geolocation", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor(red: CGFloat(32.0/255.0), green: CGFloat(78.0/255.0), blue: CGFloat(199.0/255.0), alpha: CGFloat(1.0))
        self.backgroundColor = UIColor(named: "background")
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(imageUmbrella)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(useButton)
        self.addSubview(notUseButton)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            
            imageUmbrella.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            imageUmbrella.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            imageUmbrella.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            imageUmbrella.heightAnchor.constraint(equalTo: imageUmbrella.widthAnchor, multiplier: 0.7),
            
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: imageUmbrella.bottomAnchor, constant: 24),
            
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            
            useButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 80),
            useButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            useButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            useButton.heightAnchor.constraint(equalToConstant: 50),
            
            notUseButton.topAnchor.constraint(equalTo: useButton.bottomAnchor, constant: 8),
            notUseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            notUseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            notUseButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

}
