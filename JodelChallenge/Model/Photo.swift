//
//  Model.swift
//  JodelChallenge
//
//  Created by Lesha on 29.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

struct Photo {
    let title: String
    let url: URL
    
    init(index: Int, url: URL) {
        self.title = String(index)
        self.url = url
    }
}
