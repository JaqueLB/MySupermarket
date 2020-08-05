//
//  LoginViewController.swift
//  SuperM
//
//  Created by Jaque on 13/07/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var viewModel: HomeViewModel
    var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func login() {
        print("login")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModal()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    func setupModal() {
        view.addSubview(loginButton)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
