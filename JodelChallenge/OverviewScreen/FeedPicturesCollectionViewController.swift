//
//  FeedPicturesCollectionViewController.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit
import FlickrKit
import SVProgressHUD

class FeedPicturesCollectionViewController: UICollectionViewController {

    private let feedPicturesDataSource = FeedPicturesDataSource()
    private let feedPicturesFlosLayout = FeedPicturesFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Images"
        feedPicturesDataSource.registerCell(self.collectionView!)
        feedPicturesFlosLayout.didSelectCell = {[unowned self] (title: String?, image: UIImage?) in
            self.presentFullImageViewController(title, image)
        }
        self.collectionView?.dataSource = feedPicturesDataSource
        self.collectionView?.delegate = feedPicturesFlosLayout
        
        self.loadData()
    }
    
    private func loadData() {
        SVProgressHUD.show(withStatus: "Loading...")
        FlickrApi.fetchPhotos { (photos:[Any]?, error: Error?) in
            SVProgressHUD.dismiss()
            if let error = error {
                self.presentErrorView(title: "Error", textMessage: error.localizedDescription, style: .alert)
                return
            }
            
            if let photos = photos as? [URL] {
                self.feedPicturesDataSource.photoViewModel = PhotoViewModel(urls: photos)
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
            
        }
    }

    @IBAction func updateClicked(_ sender: UIBarButtonItem) {
        loadData()
    }
    
    private func presentFullImageViewController(_ title: String?,  _ image: UIImage?) {
        let fullImageVC = FullImageViewController(nibName: String(describing: FullImageViewController.self), bundle: nil)
        
        fullImageVC.imageToShow = image
        fullImageVC.title = title
        self.navigationController?.pushViewController(fullImageVC, animated: true)
    }
    
    
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
