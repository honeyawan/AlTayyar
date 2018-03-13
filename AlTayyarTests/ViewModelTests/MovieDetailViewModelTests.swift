//
//  MovieDetailViewModelTests.swift
//  AlTayyarTests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class MovieDetailViewModelTests: XCTestCase {
    
    var categoryViewModel: ATMovieDetailViewModel!

        
    override func setUp() {
        super.setUp()
        let movie = ATMovieEntity.init(posterPath: "somePosterPath.jpg", backdropPath: "somePosterPath.jpg", overview: "Test Movie", releaseDate: "10-08-12", originalTitle: "Test Movie", originalLanguage: "en", title: "Some Title", popularity: 7.5, voteCount: 999, adult: false, video: false, voteAverage: 7.5, genreIds: [1,2,3], identifier: 123)
        categoryViewModel = ATMovieDetailViewModel(movie: movie)
       }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testDescriptionForMovieDetail() {
        XCTAssertEqual(categoryViewModel.descriptionForMovieDetail, "Test Movie")
    }
    
    
    func testRatingsForMovieDetail() {
        XCTAssertEqual(categoryViewModel.titleForRating, "7.5 Ratings")

    }
    
    
    func testImageForMovieDetail() {
        XCTAssertTrue(categoryViewModel.imageForMovieDetail().contains("somePosterPath.jpg"))
    }
    
    func testTitleForMovieDetail() {
        XCTAssertEqual(categoryViewModel.titleForMovieDetail, "Some Title")

    }

    
}
