//
//  MovieCategoryViewModelTests.swift
//  AlTayyarTests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class MovieCategoryViewModelTests: XCTestCase {
        
    var categoryViewModel: ATMovieCategoryViewModel!
    
    override func setUp() {
        super.setUp()
        categoryViewModel = ATMovieCategoryViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testnumberOfCategories() {
        XCTAssertEqual(categoryViewModel.numberOfCategories(), 6)
    }
    
    func testTitleForSection() {
        XCTAssertEqual(categoryViewModel.titleForSection(0), "Popularity")
    }
    
    func testIdentifierForSection () {
        XCTAssertEqual(categoryViewModel.identifierForSection(0), "popularity.desc")
    }
    

}
