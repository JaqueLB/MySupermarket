//
//  HomeViewModel.swift
//  SuperM
//
//  Created by Jaque on 29/06/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    // private only for write operations
    private(set) var groceries = [GroceryItem]()
    private var dataSource: UITableViewDiffableDataSource<SectionListCollection, GroceryItem>?
    
    func add(item: GroceryItem) {
        groceries.append(item)
        snapshot(from: groceries)
    }
    
    func setupDataSource(for tableView:UITableView) {
        dataSource = UITableViewDiffableDataSource<SectionListCollection, GroceryItem>(tableView: tableView, cellProvider: {
            (tableView, indexPath, groceryItem) -> HomeTableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
            cell.populate(groceryItem)
            return cell
        })
    }

    func snapshot(from listCollection: [GroceryItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionListCollection, GroceryItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(groceries, toSection: .main)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
