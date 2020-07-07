//
//  HomeTableViewController.swift
//  SuperM
//
//  Created by Jaque on 17/04/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        viewModel.setupDataSource(for: tableView)
    }
    
    @objc func addButtonTapped() {
        present(AddItemViewController(viewModel: viewModel), animated: true, completion: nil)
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My Supermarket"
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        let loginButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItems = [addButton, loginButton]
    }
    
    func setupTableView() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}
