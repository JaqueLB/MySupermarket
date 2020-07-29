//
//  HomeViewModel.swift
//  SuperM
//
//  Created by Jaque on 29/06/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit
// para criar acesso entre o controller e view model
//protocol HomeViewModelDelegate: class {
//    var controller:UIViewController { get }
//// todo: fazer com closures!
//}

class HomeViewModel: NSObject {
    // private only for write operations
    private(set) var groceries = [GroceryItem]()
    private var dataSource: UITableViewDiffableDataSource<SectionListCollection, GroceryItem>?

//    weak var delegate:HomeViewModelDelegate?

    // closure, the signature of the
    var didTapGroceryList: ((ItemDetailViewController) -> Void)?

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

    func didSelectRowAt(_ indexPath: IndexPath) {
        print(indexPath.row)
        if let item = dataSource?.itemIdentifier(for: indexPath) {
            print(item.title)
            let itemDetail = ItemDetailViewController()
            itemDetail.itemNoWrap = item
//            itemDetail.item = item
            // delegate que me da acesso a view controller de dentro da view model - injecao de dados
//            delegate?.controller.navigationController?.pushViewController(itemDetail, animated: true)
            // com closures, vamos declarar uma informacao e a controller chama a proxima tela. Conceito de Events e listeners.
            didTapGroceryList?(itemDetail)
        }
    }

    func deleteRowAt(_ indexPath: IndexPath) {
        groceries.remove(at: indexPath.row)
        snapshot(from: groceries)
    }
}
