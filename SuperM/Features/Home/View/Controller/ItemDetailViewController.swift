//
//  ItemDetailViewController.swift
//  SuperM
//
//  Created by Jaque on 20/07/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    var itemNoWrap: GroceryItem?

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        setupNavigation()

    }

    func setupNavigation() {
        guard let item = itemNoWrap else { return }
        navigationItem.title = item.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapAddButton))
    }

    @objc func didTapAddButton() {
        print("e nois")
    }
}
