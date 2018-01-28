//
//  FeedPicturesCollectionViewCell.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit
import AFNetworking

class FeedPicturesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fullImageView: UIImageView!
    
    func configure(withURL url: URL) {
        self.fullImageView.setImage(url: url)
    }
}
