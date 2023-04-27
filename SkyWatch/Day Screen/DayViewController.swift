//
//  DayViewController.swift
//  SkyWatch
//
//  Created by maksym on 2023-04-24.
//

import UIKit

class DayViewController: UIViewController {
    
    let mainView = DayView()

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
