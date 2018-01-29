//
//  FeedPicturesFlowLayout.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

class FeedPicturesFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    var didSelectCell: ((_ title: String?, _ image: UIImage?) -> Void)?

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width + 20)
    }
}

extension FeedPicturesFlowLayout : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FeedPicturesCollectionViewCell {
            didSelectCell?(cell.titleLabel.text, cell.fullImageView?.image)
        }
    }
}
