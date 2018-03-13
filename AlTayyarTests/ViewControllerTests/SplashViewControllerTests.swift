//
//  AlTayyarUITests.swift
//  AlTayyarUITests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class SplashViewControllerTests: XCTestCase {
    
    
    var splashViewController: ATSplashViewController!
    
    
    override func setUp() {
        
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        splashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewControllerID") as! ATSplashViewController
        _ = splashViewController.view
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIBOutletsAreNotNil() {
        XCTAssertNotNil(splashViewController.view)

    }
    

}
