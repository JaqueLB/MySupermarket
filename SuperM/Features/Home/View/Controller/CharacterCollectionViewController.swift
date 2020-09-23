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
        setupNavigation()
        setupCollectionView()
        // [weak self] is here to avoid memory leak
        viewModel.fetch(with: "https://rickandmortyapi.com/api/character/") { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
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

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.willDisplayAt(indexPath) { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

// MARK: - Delegates for layout
extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width inteira da tela dividido por 3 - os espacos
        let width = (UIScreen.main.bounds.width / 3) - 16
        return CGSize(width: width, height: 148)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

// Desafio para semana que vem: Criar um click para cada item, e uma tela de detalhes, passando algum dado desse item para a proxima tela
