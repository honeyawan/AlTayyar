//
//  AlTayyarUITests.swift
//  AlTayyarUITests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class TableViewCellTests: XCTestCase {
    
    var moviesTableViewCell: ATMoviesTableViewCell!
    
    
    override func setUp() {
        
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let movieListViewController = storyboard.instantiateViewController(withIdentifier: "MoviesListViewControllerID") as! ATMoviesListViewController
        _ = movieListViewController.view
        
        moviesTableViewCell =  movieListViewController.tableView(movieListViewController.tableView, cellForRowAt: IndexPath.init(row: 0, section: 0)) as! ATMoviesTableViewCell

    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIBOutletsAreNotNil() {
        XCTAssertNotNil(moviesTableViewCell.collectionView)
        XCTAssertNotNil(moviesTableViewCell.mainSpinner)
        XCTAssertNotNil(moviesTableViewCell.rightSpinner)
    }
    
    
    func testConformsToCollectionViewDelegate() {
        
        XCTAssertNotNil(moviesTableViewCell.collectionView.dataSource)
        XCTAssertNotNil(moviesTableViewCell.collectionView.delegate)
        
        XCTAssert(moviesTableViewCell.conforms(to: UICollectionViewDelegate.self))
        XCTAssert(moviesTableViewCell.conforms(to: UICollectionViewDataSource.self))
        
        XCTAssert(moviesTableViewCell.responds(to: #selector(moviesTableViewCell.collectionView(_:cellForItemAt:))))
        XCTAssert(moviesTableViewCell.responds(to: #selector(moviesTableViewCell.collectionView(_:numberOfItemsInSection:))))

    }
    

}
