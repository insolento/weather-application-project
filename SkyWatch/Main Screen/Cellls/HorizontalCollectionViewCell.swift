import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    private lazy var time: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:00"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var weatherImage: UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "Frame3")?.cgImage
        return logoView
    }()
    
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23°"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(time: String, weatherImage: WeatherState, temperature: String) {
        self.time.text = time
        self.temperature.text = temperature + "°"
        switch weatherImage {
        case .sun:
            self.weatherImage.layer.contents = UIImage(named: "Frame1")?.cgImage
        case .cloudSunRain:
            self.weatherImage.layer.contents = UIImage(named: "Frame2")?.cgImage
        case .cloudRain:
            self.weatherImage.layer.contents = UIImage(named: "Frame3")?.cgImage
        case .cloud:
            self.weatherImage.layer.contents = UIImage(named: "Frame4")?.cgImage
        case .rain:
            self.weatherImage.layer.contents = UIImage(named: "Frame5")?.cgImage
        }
    }
    
    func addSubviews() {
        contentView.addSubview(time)
        contentView.addSubview(weatherImage)
        contentView.addSubview(temperature)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            time.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 40),
            weatherImage.widthAnchor.constraint(equalToConstant: 40),
            
            temperature.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }

}
