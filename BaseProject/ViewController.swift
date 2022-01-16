//
//  HomeViewController.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 07/06/21.
//

import UIKit
import SwiftProtobuf

final class HomeViewController: UIViewController {
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DonkeyCell.self, forCellReuseIdentifier: "donkeyCellType")
        return tableView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var donkeys: [Donkey]?
    
    override func loadView() {
        super.loadView()
        setUpLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLSession.shared.dataTask(
            with: URL(string: "http://localhost:8080/donkeys")!,
            completionHandler: { [weak self] data, response, error in
//                guard error == nil,
//                      let data = data,
//                      let string = String(data: data, encoding: .utf8)
//                else {
//                    print(error ?? "Unknown error")
//                    return
//                }
                let donkeys = try! Donkeys(serializedData: data!)
                self?.donkeys = donkeys.donkeys
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }
        ).resume()
    }
    
    private func setUpLayout() {
        view.backgroundColor = .clear
        view.addSubview(containerView)
        containerView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            containerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 30),
            containerView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30),
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donkeyCellType",
                                 for: indexPath) as! DonkeyCell
        cell.config(with: donkeys?[indexPath.row].name ?? "Nessun Asinello")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donkeys?.count ?? 1
    }
}
