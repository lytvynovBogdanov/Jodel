//
//  UIImageView.swift
//  JodelChallenge
//
//  Created by Lesha on 28.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(url: URL) {
        if let image = ImageWorker.shared.imageFromCache(url: url) {
            self.image = image
        } else {
            self.setImageWith(url)
        }
    }
}
