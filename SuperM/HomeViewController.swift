//
//  ViewController.swift
//  SuperM
//
//  Created by Jaque on 03/04/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

// https://developer.apple.com/documentation/uikit/uinavigationcontroller
class HomeViewController: UIViewController {
  private lazy var emptyText: UILabel = {
        let emptyText = UILabel()
        emptyText.textColor = .systemGray4
        emptyText.text = "Add a list to start"
        emptyText.textAlignment = .center
        emptyText.font = UIFont.systemFont(ofSize: 24)
        emptyText.translatesAutoresizingMaskIntoConstraints = false
        return emptyText
    }()
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add List", for: .normal)
        addButton.setTitleColor(.systemPurple, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.systemPurple, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My Supermarket"
        navigationItem.largeTitleDisplayMode = .automatic
        setupUI()
    }
}

extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(emptyText)
        view.addSubview(addButton)
        view.addSubview(loginButton)
 
        NSLayoutConstraint.activate([
            emptyText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addButton.rightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginButton.leftAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10)
        ])
    }
}

