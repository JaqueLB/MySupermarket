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

    // closure, the signature of the
    var didTapGroceryList: ((ItemDetailViewController) -> Void)?

    var refreshData: (() -> Void)?

    var didEditGroceryItem: ((GroceryItem) -> Void)?

    func add(item: GroceryItem) {
        groceries.append(item)
        refreshData?()
    }

    func numberOfRows(_ section:Int) -> Int {
        return groceries.count
    }

    func cellForRowAt(_ indexPath:IndexPath) -> GroceryItem {
        return groceries[indexPath.row]
    }

    func didSelectRowAt(_ indexPath: IndexPath) {
        let itemDetail = ItemDetailViewController()
        itemDetail.itemNoWrap = cellForRowAt(indexPath)
        didTapGroceryList?(itemDetail)
    }

    func deleteRowAt(_ indexPath: IndexPath) {
        groceries.remove(at: indexPath.row)
        refreshData?()
    }

    func editRowAt(_ indexPath:IndexPath) {
        didEditGroceryItem?(cellForRowAt(indexPath))
    }
}
