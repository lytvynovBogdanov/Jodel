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
    
    private func presentFullImageViewController(_ title: String?,  _ image: UIImage?) {
        let fullImageVC = FullImageViewController(nibName: String(describing: FullImageViewController.self), bundle: nil)
        
        fullImageVC.imageToShow = image
        fullImageVC.title = title
        self.navigationController?.pushViewController(fullImageVC, animated: true)
    }

    @IBAction func updateClicked(_ sender: UIBarButtonItem) {
        loadData()
    }
}
