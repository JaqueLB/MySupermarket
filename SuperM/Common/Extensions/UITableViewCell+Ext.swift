//
//  UITableViewCell+Ext.swift
//  SuperM
//
//  Created by Jaque on 05/06/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit
// adicionar mais funcionalidade no padrao do que ja eh feito na classe target (prototype do js, nao eh heranca comum)
extension UITableViewCell {
    // o nome da cell como identificador, para cada cell
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
