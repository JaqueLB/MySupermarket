//
//  CharacterViewModel.swift
//  SuperM
//
//  Created by Jaque on 03/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import Foundation

class CharacterViewModel {
    private lazy var results = [Results]()

    private let service = Service()

    private lazy var character: Character? = nil

    func numberOfItems(_ section:Int) -> Int {
        return results.count
    }

    func cellForItemAt(_ indexPath:IndexPath) -> Results {
        return results[indexPath.item]
    }

    func populate(with url: String) {
        service.fetch(url: url, type: Character.self) { (result) in
            switch result {
            case .success(let character):
                self.character = character
//                self.results = character.results - we could use for the first call
                character.results.forEach { (result) in
                    self.results.append(result)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchCharacters() {
        let url = "https://rickandmortyapi.com/api/character/"
        populate(with: url)
    }

    func fetchNextCharacters(url: String) {
        populate(with: url)
    }
}
