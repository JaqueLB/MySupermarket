//
//  UIImageView+Ext.swift
//  SuperM
//
//  Created by Jaque on 24/08/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

public var cache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadAndCache(url: String, key: String) {
        backgroundColor = .lightGray
        image = nil
        if let cachedImage = cache.object(forKey: key as AnyObject) as? UIImage {
            // image already loaded on cache
            image = cachedImage
            return
        }

        Service().fetch(url: url) { (result) in
            // same Result from Apple
            switch result {

            case .success(let image):
                cache.setObject(image, forKey: key as AnyObject)
                // image could be still loading from service
                DispatchQueue.main.async {
                    self.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
