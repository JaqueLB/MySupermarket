//
//  ViewController.swift
//  SuperM
//
//  Created by Jaque on 03/04/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

// https://developer.apple.com/documentation/uikit/uinavigationcontroller
class HomeController: UINavigationController {
    private lazy var menuText: UILabel = {
            let menuText = UILabel()
            menuText.textColor = UIColor.purple
            menuText.text = "My Supermarket"
            menuText.textAlignment = .center
            menuText.translatesAutoresizingMaskIntoConstraints = false
            return menuText
    }()
    
    private lazy var emptyText: UILabel = {
        let emptyText = UILabel()
        emptyText.textColor = UIColor.systemGray4
        emptyText.text = "Add a list to start"
        emptyText.textAlignment = .center
        emptyText.font = UIFont.systemFont(ofSize: 24)
        emptyText.translatesAutoresizingMaskIntoConstraints = false
        return emptyText
    }()
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add List", for: .normal)
        addButton.setTitleColor(.purple, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.purple, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension HomeController {
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(menuText)
        view.addSubview(emptyText)
        view.addSubview(addButton)
        view.addSubview(loginButton)
 
        NSLayoutConstraint.activate([
            menuText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emptyText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addButton.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginButton.leftAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10)
        ])
    }
}

