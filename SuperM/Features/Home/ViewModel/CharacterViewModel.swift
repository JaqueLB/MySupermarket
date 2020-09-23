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

    func numberOfItems(_ section: Int) -> Int {
        return results.count
    }

    func cellForItemAt(_ indexPath: IndexPath) -> Results {
        return results[indexPath.item]
    }

    func willDisplayAt(_ indexPath: IndexPath, completion: @escaping () -> Void) {
        if results.last?.id == results[indexPath.item].id {
            guard let nextPageUrl = character?.info.next else { return }
            fetch(with: nextPageUrl) {
                completion()
            }
        }
    }

    func fetch(with url: String, completion: @escaping () -> Void) {
        service.fetch(url: url, type: Character.self) { (result) in
            switch result {
            case .success(let character):
                self.character = character
//                self.results = character.results - we could use for the first call
                character.results.forEach { (result) in
                    self.results.append(result)
                }
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
