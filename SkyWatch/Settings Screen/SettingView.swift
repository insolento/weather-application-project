//
//  SettingView.swift
//  SkyWatch
//
//  Created by maksym on 2023-04-24.
//

import UIKit

class SettingView: UIView {
    
    let cloud1 : UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "vector1")?.cgImage
        return logoView
    }()
    
    let cloud2 : UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "vector2")?.cgImage
        return logoView
    }()
    
    let cloud3 : UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = UIImage(named: "vector3")?.cgImage
        return logoView
    }()
    
    let operatingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: CGFloat(233/255.0), green: CGFloat(238/255.0), blue: CGFloat(250/255.0), alpha: CGFloat(1.0))
        view.layer.cornerRadius = 20
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCellReuse")
        tableView.alwaysBounceVertical = false
        return tableView
    }()
    
    let setButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "background")
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(cloud1)
        self.addSubview(cloud2)
        self.addSubview(cloud3)
        self.addSubview(operatingView)
        operatingView.addSubview(tableView)
        operatingView.addSubview(setButton)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            cloud2.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            cloud2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            cloud2.heightAnchor.constraint(equalToConstant: 60),
            cloud2.widthAnchor.constraint(equalToConstant: 250),
            
            cloud1.topAnchor.constraint(equalTo: cloud2.bottomAnchor, constant: 24),
            cloud1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 4),
            cloud1.heightAnchor.constraint(equalToConstant: 100),
            cloud1.widthAnchor.constraint(equalToConstant: 200),
            
            cloud3.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            cloud3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            cloud3.heightAnchor.constraint(equalToConstant: 70),
            cloud3.widthAnchor.constraint(equalToConstant: 220),
            
            operatingView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            operatingView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            operatingView.heightAnchor.constraint(equalToConstant: 350),
            operatingView.widthAnchor.constraint(equalToConstant: 320),
            
            tableView.topAnchor.constraint(equalTo: operatingView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: operatingView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: operatingView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: operatingView.bottomAnchor, constant: -82),
            
            setButton.bottomAnchor.constraint(equalTo: operatingView.bottomAnchor, constant: -16),
            setButton.leadingAnchor.constraint(equalTo: operatingView.leadingAnchor, constant: 24),
            setButton.trailingAnchor.constraint(equalTo: operatingView.trailingAnchor, constant: -24),
            setButton.widthAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}
