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
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        let _ = viewController.view
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
    
    func testUILabels() {
        viewController.getCurrentWeather()
        XCTAssertNotNil(viewController.temperatureLabel.text)
        XCTAssertNotNil(viewController.precipitationLabel.text)
        XCTAssertNotNil(viewController.humidityLabel.text)
        XCTAssertNotNil(viewController.summaryLabel.text)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

    
}
