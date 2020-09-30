//
//  CharacterDetailViewController.swift
//  SuperM
//
//  Created by Jaque on 29/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    var character: Results?

    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = character?.gender
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true // cut
        imageView.contentMode = .scaleToFill // fill without distortion
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUi()
    }

    func setupNavigation() {
        navigationItem.title = character?.name
    }

    func setupImageView() {
        guard let image = character?.image else { return }
        characterImageView.loadAndCache(url: image, key: image)
    }

    func setupUi() {
        view.backgroundColor = .systemBackground

        setupImageView()

        view.addSubview(genderLabel)
        view.addSubview(characterImageView)

        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            characterImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 132),
            characterImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 132),

            genderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            genderLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            genderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
}
