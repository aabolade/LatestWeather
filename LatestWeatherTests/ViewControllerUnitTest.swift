//
//  ViewControllerUnitTest.swift
//  LatestWeather
//
//  Created by Leke Abolade on 12/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import XCTest
@testable import LatestWeather

class ViewControllerUnitTest: XCTestCase {
    
    var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
    }
    
    func testHasMethodThatCallsAPIService() {
    
        class FakeAPIService: APIService {
            var getWeatherJSONWasCalled = false
        
            override func getWeatherJSON(_ completion: @escaping JSONDictionaryCompletion) {
                getWeatherJSONWasCalled = true
            }
        }
        
        let vc = ViewController()
        vc.apiService = FakeAPIService()
        vc.getCurrentWeather()
        
        XCTAssertTrue((vc.apiService as! FakeAPIService).getWeatherJSONWasCalled)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

    
}
