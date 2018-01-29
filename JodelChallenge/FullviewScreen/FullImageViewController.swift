//
//  FullImageViewController.swift
//  JodelChallenge
//
//  Created by Lesha on 28.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {
    
    var imageToShow: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.imageView.image = self.imageToShow
    }
}

extension FullImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView;
    }    
}
