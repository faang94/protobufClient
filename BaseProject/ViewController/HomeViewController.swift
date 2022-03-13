//
//  HomeViewController.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 07/06/21.
//

import UIKit

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
    var viewModel: HomeViewModel
    
    
    override func loadView() {
        super.loadView()
        setUpLayout()
    }

    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onDeveloperUpdated = { [weak self] developers in
            self?.datasource = developers
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        viewModel.fetchDevelopers(
            onFailure: { error in
                print(error)
            }
        )
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
        guard let datasource: TitleTableViewDataSource = datasource?[indexPath.row] else { return UITableViewCell() }
        cell.config(with: datasource)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 1
    }
}
