//
//  JodelChallengeTests.swift
//  JodelChallengeTests
//
//  Created by Lesha on 29.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import XCTest

class PhotoViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        var photoViewModel = PhotoViewModel(urls: [])
        XCTAssertEqual(photoViewModel.photos.count, 0)
        if let url = URL(string: "https://github.com/Jodel/Jodel-iOS-Challenge/raw/master/jodellogo.png") {
            photoViewModel = PhotoViewModel(urls: [url])
            XCTAssertEqual(photoViewModel.photos.count, 1)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
