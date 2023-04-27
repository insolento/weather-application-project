//
//  MainView.swift
//  SkyWatch
//
//  Created by maksym on 2023-04-24.
//

import UIKit

class MainView: UIView {
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Toronto, Canada"
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
        let image = UIImage(systemName: "gear")
        button.setImage(image, for: .normal)
        return button
    }()
    
    let mainWeatherView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "background")
        view.layer.cornerRadius = 10
        return view
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
        
    }
    
    func layout() {
        
    }

}
