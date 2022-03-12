//
//  HomeViewController.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 07/06/21.
//

import UIKit
import SwiftProtobuf

typealias Developer = GetDevelopersResponse.Developer

final class HomeViewController: UIViewController {
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: TitleTableViewCell.self)
        return tableView
    }()
    
    var datasource: [Developer]?
    
    override func loadView() {
        super.loadView()
        setUpLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLSession.shared.dataTask(
            with: URL(string: "http://localhost:8080/developers")!,
            completionHandler: { [weak self] data, response, error in
                guard error == nil,
                      let data = data
                else {
                    print(error ?? "Unknown error")
                    return
                }
                
                let developers = try! GetDevelopersResponse(serializedData: data)
                self?.datasource = developers.developers
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }
        ).resume()
    }
        
    private func setUpLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as TitleTableViewCell
        cell.config(with: datasource?[indexPath.row].name ?? "Nessun Developer")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 1
    }
}
