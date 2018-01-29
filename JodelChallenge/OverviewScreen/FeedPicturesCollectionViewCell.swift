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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullImageView: UIImageView!
    
    func configure(title: String, url: URL) {
        self.titleLabel.text = title
        self.fullImageView.setImage(url: url)
    }
}
