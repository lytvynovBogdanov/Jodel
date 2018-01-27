//
//  FeedPicturesCollectionViewController.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit
import FlickrApi

private let feedPicturesDataSource = FeedPicturesDataSource()

class FeedPicturesCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.dataSource = feedPicturesDataSource;
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: feedPicturesDataSource.cellIdentifier)
    }
    
    private func loadData() {
        FlickrApi
        [FlickrApi fetchPhotosWithCompletion:^(NSArray *photos, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            });
            self.photos = photos;
            NSLog(@"result %@ error %@", photos, error);
            }];
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
