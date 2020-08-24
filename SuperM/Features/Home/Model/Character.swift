//
//  Character.swift
//  SuperM
//
//  Created by Jaque on 24/08/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import Foundation

// encode/decode - Codable; Hashable - for, foreach
struct Character: Codable, Hashable {
    let info: Info
    let results: [Results]
}

struct Info: Codable, Hashable {
    let next: String?
}

struct Results: Codable, Hashable {
    let id: Int?
    let name: String?
    let gender: String?
    let image: String?
}
