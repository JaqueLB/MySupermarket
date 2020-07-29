//
//  ItemDetailViewController.swift
//  SuperM
//
//  Created by Jaque on 20/07/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
//    var item: GroceryItem! // do not use. Force unwrap - eu como dev garanto que tem sempre informacao dentro dela - la garantia soy jho

    var itemNoWrap: GroceryItem? // pode ter valor ou nao
//    var addButton: UIBarButtonItem = {
//        var button = UIBarButtonItem()
//        button.set
//        return button
//    }()

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        setupNavigation()

    }

    func setupNavigation() {
        guard let item = itemNoWrap else { return }
//        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = item.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapAddButton))
    }

    @objc func didTapAddButton() {
        print("e nois")
    }
}
