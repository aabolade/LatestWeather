//
//  APIServiceTests.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import XCTest

class APIServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testGetWeatherJSON() {
        let expect = expectation(description: "API service")
        
        let apiService = APIService()
        apiService.getWeatherJSON() { (currentWeather) in
            XCTAssertNotNil(currentWeather, "Expected non-nil object")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
   
    
}
