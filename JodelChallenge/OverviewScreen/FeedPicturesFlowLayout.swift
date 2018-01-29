//
//  FeedPicturesFlowLayout.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

class FeedPicturesFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    private var startingScrollingOffset = CGPoint.zero
    var page: CGFloat = 0.0
    var cellHeight: CGFloat = 0.0
    
    var didSelectCell: ((_ title: String?, _ image: UIImage?) -> Void)?

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellHeight = collectionView.frame.size.width + 20
        return CGSize(width: collectionView.frame.size.width, height: cellHeight)
    }
}

extension FeedPicturesFlowLayout : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FeedPicturesCollectionViewCell {
            didSelectCell?(cell.titleLabel.text, cell.fullImageView?.image)
        }
    }
}

extension FeedPicturesFlowLayout : UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingScrollingOffset = scrollView.contentOffset
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = scrollView.contentOffset.y + scrollView.contentInset.top
        let proposedPage = offset / CGFloat(max(cellHeight, 1))
        let snapPoint: CGFloat = 0.1
        let snapDelta: CGFloat = offset > startingScrollingOffset.y ? (1 - snapPoint) : snapPoint
        
        if floor(proposedPage + snapDelta) == floor(proposedPage) {
            page = floor(proposedPage)
        } else {
            page = floor(proposedPage + 1)
        }
        
        targetContentOffset.pointee = CGPoint(
            x: CGFloat(targetContentOffset.pointee.y),
            y: CGFloat(cellHeight) * page
        )
    }
}
