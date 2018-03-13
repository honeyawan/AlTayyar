//
//  ConfigurationViewModelTests.swift
//  AlTayyarTests
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import XCTest
@testable import AlTayyar

class ConfigurationViewModelTests: XCTestCase {
        
    var configViewModel: ATConfigurationViewModel!
    
    override func setUp() {
        super.setUp()
        configViewModel = ATConfigurationViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetConfiguration(){
        
        let expectation = self.expectation(description: "download Data Expectation")
        configViewModel.downloadData { (apiConfigs) in
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 15) { (error) in

        }
        
    }
    
}
