//
//  24HViewController.swift
//  SkyWatch
//
//  Created by maksym on 2023-04-24.
//

import UIKit

class _24HViewController: UIViewController {
    
    let mainView = _24HView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupView()
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
}
