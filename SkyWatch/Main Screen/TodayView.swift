import UIKit

class TodayView: UIView {
    
    private lazy var progressContainerView = UIView()
    private lazy var publicRadius:CGFloat = 0
    
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7°/13°"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var temperatureNow: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13°"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private lazy var prediction: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Light rain probability"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var speed: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3 m/s"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var rainProbability: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "75%"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var dateFull: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "17:35, friday 16 april"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var sunrise: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05:41"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
    private lazy var sunset: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19:31"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var speedImage: UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "Frame3")?.cgImage
        return logoView
    }()
    
    private lazy var rainImage: UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "Frame3")?.cgImage
        return logoView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "background")
        publicRadius = self.bounds.height*0.6
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func circleCreation() {
        progressContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = CGColor(red: CGFloat(246.0/255.0), green: CGFloat(221/255.0), blue: CGFloat(1/255.0), alpha: CGFloat(1.0))
        shapeLayer.lineWidth = 3
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = nil
        progressContainerView.layer.addSublayer(shapeLayer)

        // Create the path for the progress menu
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY*1.4)
        let radius: CGFloat = self.bounds.height*0.6
        let startAngle = CGFloat(Double.pi)
        let endAngle = CGFloat(Double.pi * 2)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        shapeLayer.path = path.cgPath
        
        
        
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        shapeLayer.add(animation, forKey: "progress")

    }
    
    func addSubviews() {
        self.addSubview(progressContainerView)
        progressContainerView.addSubview(rainImage)
        progressContainerView.addSubview(speedImage)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            progressContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            progressContainerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            progressContainerView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            rainImage.leadingAnchor.constraint(equalTo: progressContainerView.leadingAnchor, constant: 16),
            rainImage.bottomAnchor.constraint(equalTo: progressContainerView.bottomAnchor, constant: -16),
            rainImage.heightAnchor.constraint(equalToConstant: 20),
            rainImage.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
