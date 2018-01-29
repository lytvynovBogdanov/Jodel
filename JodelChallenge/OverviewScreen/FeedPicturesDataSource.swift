//
//  FeedPicturesDataSource.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

class FeedPicturesDataSource: NSObject, UICollectionViewDataSource {
    
    let cellIdentifier = String(describing: FeedPicturesCollectionViewCell.self)
    var photoViewModel = PhotoViewModel(urls: [])
    
    func registerCell(_ collectionView: UICollectionView) {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoViewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeedPicturesCollectionViewCell
        let photo = photoViewModel.photos[indexPath.row]
        cell.configure(title: photo.title, url: photo.url)
        
        return cell
    }
    
}
