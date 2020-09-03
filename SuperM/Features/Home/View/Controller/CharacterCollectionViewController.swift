//
//  CharacterCollectionViewController.swift
//  SuperM
//
//  Created by Jaque on 03/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    private lazy var viewModel = CharacterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupCollectionView() {
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemBackground
    }

    func setupNavigation() {
        navigationItem.title = "Rick and Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Delegates for config
extension CharacterCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell

        cell.populate(result: viewModel.cellForItemAt(indexPath))

        return cell
    }
}

// MARK: - Delegates for layout
extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {

}
