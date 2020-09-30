//
//  CharacterCollectionViewCell.swift
//  SuperM
//
//  Created by Jaque on 03/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    // MARK: - properties
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true // cut
        imageView.contentMode = .scaleAspectFill // fill without distortion
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - methods
    func setupUI() {
        addSubview(characterImageView)
        addSubview(characterNameLabel)

        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }

    func populate(result: Results) {
        characterNameLabel.text = result.name
        guard let image = result.image else { return }
        characterImageView.loadAndCache(url: image, key: image)
    }
}
