//
//  PhotoViewModel.swift
//  JodelChallenge
//
//  Created by Lesha on 29.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

struct PhotoViewModel {
    
    var photos: [Photo]
    
    init(urls:[URL]) {
        self.photos = urls.enumerated().map({ Photo(index: $0, url: $1) })
    }
}
