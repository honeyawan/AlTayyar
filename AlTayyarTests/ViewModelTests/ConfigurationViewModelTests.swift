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
        
       let expectation = XCTestExpectation.init(description: "wait For Config Response")
        configViewModel.getConfiguration { (apiConfigs) in
            expectation.fulfill()

        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            if(error != nil)
            {
                XCTFail("unable To Get Response from config API")
            }

        }
        
    }
    
}
