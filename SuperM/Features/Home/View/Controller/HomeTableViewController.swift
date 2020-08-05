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
        setupViewModel()
    }
    
    @objc func addButtonTapped() {
        // navegacao sem modal, outra tela
//        navigationController?.pushViewController(AddItemViewController(viewModel: viewModel), animated: true)
        // modal, adiciona outro item a hierarquia
        present(AddItemViewController(viewModel: viewModel), animated: true, completion: nil)
    }

    @objc func loginButtonTapped() {
        present(LoginViewController(viewModel: viewModel), animated: true, completion: nil)
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My Supermarket"
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        let loginButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItems = [addButton, loginButton]
    }
    
    func setupTableView() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }

    func setupViewModel() {
        viewModel.didTapGroceryList = { itemDetailController in
            self.navigationController?.pushViewController(itemDetailController, animated: true)
        }
        viewModel.refreshData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
        cell.populate(viewModel.cellForRowAt(indexPath))
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "delete") { (contextualAction, view, boolValue) in
            self.viewModel.deleteRowAt(indexPath)
        }

        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }
}
