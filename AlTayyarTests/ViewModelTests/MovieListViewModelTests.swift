//
//  MovieListViewModelTests.swift
//  AlTayyarTests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class MovieListViewModelTests: XCTestCase {
        
    var movieListViewModel: ATMovieListViewModel!
    
    
    override func setUp() {
        super.setUp()
        let categoryModel = ATMovieCategoryViewModel()
        movieListViewModel = ATMovieListViewModel(movieIdentifier: categoryModel.identifierForSection(0))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testFetchMovies() {
        let expectation = self.expectation(description: "wait For Movies Response")

        XCTAssertEqual(movieListViewModel.numberOfMovies(), 0)
        movieListViewModel.fetchMovies {
            let moviesCount = self.movieListViewModel.numberOfMovies()
            XCTAssertGreaterThan(moviesCount, 0)
            expectation.fulfill()

        }
        
        self.waitForExpectations(timeout: 10) { (error) in

        }
    }
    

    
}
