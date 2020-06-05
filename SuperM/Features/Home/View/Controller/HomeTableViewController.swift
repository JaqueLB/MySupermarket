//
//  HomeTableViewController.swift
//  SuperM
//
//  Created by Jaque on 17/04/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    private var listCollection = [GroceryItem]()
    private var dataSource: UITableViewDiffableDataSource<SectionListCollection, GroceryItem>?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        setupDataSource()
    }

    @objc func addButtonTapped() {
        print("oi")
    }

    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My Supermarket"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
    }

    func setupTableView() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}

extension HomeTableViewController {
    func setupDataSource() {
        dataSource = UITableViewDiffableDataSource<SectionListCollection, GroceryItem>(tableView: tableView, cellProvider: {
            (tableView, indexPath, groceryItem) -> HomeTableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
            return cell
        }
    }

    func snapshot(from listCollection: [GroceryItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionListCollection, GroceryItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(listCollection, toSection: .main)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
