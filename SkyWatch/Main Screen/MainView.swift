import UIKit

class MainView: UIView {
    
    let titleM: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Toronto, Canada"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "location")
        button.setImage(image, for: .normal)
        return button
    }()
    
    let leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "line.3.horizontal")
        button.setImage(image, for: .normal)
        return button
    }()
    
    let mainWeatherView: TodayView = {
        let view = TodayView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let moreButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration?.titleAlignment = .trailing
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 17),
              .foregroundColor: UIColor.black,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        let attributeString = NSMutableAttributedString(
                string: "More details for 24 hours",
                attributes: yourAttributes
             )
        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(titleM)
        self.addSubview(rightButton)
        self.addSubview(leftButton)
        self.addSubview(mainWeatherView)
        self.addSubview(moreButton)
        self.addSubview(collectionView)
        self.addSubview(verticalCollectionView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            titleM.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            titleM.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            rightButton.centerYAnchor.constraint(equalTo: titleM.centerYAnchor, constant: 20),
            rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            rightButton.widthAnchor.constraint(equalToConstant: 20),
            rightButton.heightAnchor.constraint(equalToConstant: 20),
            
            leftButton.centerYAnchor.constraint(equalTo: titleM.centerYAnchor, constant: 20),
            leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            leftButton.widthAnchor.constraint(equalToConstant: 20),
            leftButton.heightAnchor.constraint(equalToConstant: 20),
            
            mainWeatherView.topAnchor.constraint(equalTo: titleM.bottomAnchor, constant: 40),
            mainWeatherView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainWeatherView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            mainWeatherView.heightAnchor.constraint(equalTo: mainWeatherView.widthAnchor, multiplier: 0.6),
            
            moreButton.topAnchor.constraint(equalTo: mainWeatherView.bottomAnchor, constant: 8),
            moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            moreButton.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            
            verticalCollectionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            verticalCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            verticalCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            verticalCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }

}
