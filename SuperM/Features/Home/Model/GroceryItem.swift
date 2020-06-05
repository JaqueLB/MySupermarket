//
//  GroceryItem.swift
//  SuperM
//
//  Created by Jaque on 22/05/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import Foundation
struct GroceryItem: Hashable {
    let id: UUID
    let title: String
}

// we can have many sections, for different pagination / filters
enum SectionListCollection {
    case main
}
