//
//  AlTayyarUITests.swift
//  AlTayyarUITests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class MovieListViewControllerTests: XCTestCase {
        
    var movieListViewController: ATMoviesListViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        movieListViewController = storyboard.instantiateViewController(withIdentifier: "MoviesListViewControllerID") as! ATMoviesListViewController
        _ = movieListViewController.view
        movieListViewController.moviesViewModel = ATMovieCategoryViewModel()
    }
    
    
    func testIBOutlestsAreNotNilAfterViewDidLoad() {
        XCTAssertNotNil(movieListViewController.tableView)
    }
    
    func testSetsTableViewDataSourceAndDelegate() {
        XCTAssertNotNil(movieListViewController.tableView.dataSource)
        XCTAssertNotNil(movieListViewController.tableView.delegate)

    }
    
    func testConformsToTableViewDataSourceProtocol() {
        
        XCTAssert(movieListViewController.conforms(to: UITableViewDataSource.self))
        XCTAssert(movieListViewController.responds(to: #selector(movieListViewController.tableView(_:numberOfRowsInSection:))))
        XCTAssert(movieListViewController.responds(to: #selector(movieListViewController.tableView(_:cellForRowAt:))))
        
    }
    
    
    func testConformsToSplitViewProtocol() {
        
        XCTAssert(movieListViewController.conforms(to: UISplitViewControllerDelegate.self))
        XCTAssert(movieListViewController.responds(to: #selector(movieListViewController.splitViewController(_:collapseSecondary:onto:))))
        
    }

    
    func testConformsToCEllDelegateProtocol() {
        
//        XCTAssert(movieListViewController.responds(to: #selector(movieListViewController.movieCellDidSelectedMovie(detailViewModel:))))
        
    }
    
    
    func testTableViewUsesCustomCell_ATMoviesTableViewCell() {
        let firstCell = movieListViewController.tableView(movieListViewController.tableView, cellForRowAt: IndexPath.init(row: 0, section: 0))
        XCTAssert(firstCell is ATMoviesTableViewCell)
    }
    


    
}
