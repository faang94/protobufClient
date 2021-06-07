//
//  HomeViewController.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 07/06/21.
//

import UIKit

final class HomeViewController: UIViewController {
        
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func loadView() {
        super.loadView()
        setUpLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpLayout() {
        view.backgroundColor = .clear
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
