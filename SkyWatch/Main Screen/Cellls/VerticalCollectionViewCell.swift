import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "17/04"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var rainChance: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "57%"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(named: "background")
        return label
    }()
    
    private lazy var prediction: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Light rain, little cloudness"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4°-11°"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var weatherImage: UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "Frame3")?.cgImage
        return logoView
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "lightblue")
        view.layer.cornerRadius = 7
        return view
    }()
    
    private lazy var arrow: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.right")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.lightGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(probability: String, date: String, startTemperature: String, endTemperature: String, description: String) {
        
    }
    
    func addSubviews() {
        contentView.addSubview(view)
        contentView.addSubview(date)
        contentView.addSubview(rainChance)
        contentView.addSubview(prediction)
        contentView.addSubview(temperature)
        contentView.addSubview(weatherImage)
        contentView.addSubview(arrow)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            date.topAnchor.constraint(equalTo: view.topAnchor),
            date.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            date.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            weatherImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
            weatherImage.leadingAnchor.constraint(equalTo: date.leadingAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 20),
            weatherImage.widthAnchor.constraint(equalToConstant: 20),
            
            rainChance.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            rainChance.trailingAnchor.constraint(equalTo: date.trailingAnchor),
            
            prediction.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 16),
            prediction.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            prediction.trailingAnchor.constraint(equalTo: temperature.leadingAnchor, constant: -4),
            
            temperature.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            temperature.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            arrow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            arrow.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
}
