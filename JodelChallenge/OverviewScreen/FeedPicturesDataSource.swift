//
//  FeedPicturesDataSource.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

class FeedPicturesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = String(describing: FeedPicturesCollectionViewCell.self)
    var photos = [URL]()
    
    func registerCell(_ collectionView: UICollectionView) {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeedPicturesCollectionViewCell
        cell.configure(withURL: photos[indexPath.row])
        
        return cell
    }
    
}
