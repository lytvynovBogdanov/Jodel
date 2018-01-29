//
//  ImageWorker.swift
//  CarReader
//
//  Created by Lesha on 02.03.17.
//  Copyright © 2016 Lesha. All rights reserved.
//

import UIKit

typealias ImageHandler = (_ image:UIImage) -> Void

private class ImageCache {
    var images = [String:UIImage]()
    
    func setImage(image: UIImage, forKey key: String) {
        images[key] = image
    }
    
    func imageForKey(key: String) -> UIImage? {
        return images[key]
    }
    
    func removeAll() {
        images.removeAll()
    }
}

class ImageWorker {
    
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.resetCache),
            name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning,
            object: nil)
    }
    
    private let imageCache:ImageCache = ImageCache()
 
    static let shared:ImageWorker = ImageWorker()
    
    func imageFromCache(url:URL) -> UIImage?
    {
        guard let image = imageCache.imageForKey(key: url.absoluteString) else { return nil }
        return image
    }
    
    @objc func resetCache() {
        imageCache.removeAll()
    }
    
    func deallooc() {
        NotificationCenter.default.removeObserver(self)
    }
}
