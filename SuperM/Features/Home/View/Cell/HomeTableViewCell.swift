//
//  HomeTableViewCell.swift
//  SuperM
//
//  Created by Jaque on 05/06/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    var itemTitle:UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    // for storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func populate(_ groceryItem: GroceryItem) {
        itemTitle.text = groceryItem.title
    }

    func setupLayout() {
        // para cell, o swift ja sabe que existe so uma contentView, nao precisa passar
        addSubview(itemTitle)

        subviews.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })

        NSLayoutConstraint.activate([// fazer o item se ajustar de acordo com o texto
            itemTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
