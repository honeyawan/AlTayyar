//
//  AlTayyarUITests.swift
//  AlTayyarUITests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class MovieDetailViewControllerTests: XCTestCase {
    
    var movieDetailViewController: ATMoviesDetailViewController!
    
    override func setUp() {
        
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        movieDetailViewController = storyboard.instantiateViewController(withIdentifier: "MoviesDetailViewControllerID") as! ATMoviesDetailViewController
        _ = movieDetailViewController.view
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIBOutletsAreNotNil() {
        
        XCTAssertNotNil(movieDetailViewController.view)
        XCTAssertNotNil(movieDetailViewController.txtView)
        XCTAssertNotNil(movieDetailViewController.lblTitle)
        XCTAssertNotNil(movieDetailViewController.lblRatings)
        XCTAssertNotNil(movieDetailViewController.lblSelectMovie)
        XCTAssertNotNil(movieDetailViewController.imageView)
        
    }
    
    func testConformsToProtocol() {
                
    }

    
    
    
    
    
}
