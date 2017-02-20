//
//  CurrentWeatherTests.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import XCTest

class CurrentWeatherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testWeatherAssignsPropertyFromDictionary() {
        let weatherDictionary = ["summary": "partly cloudy", "temperature": 60, "humidity": 0.68, "precipProbability": 0.2] as [String : Any]
        let currentWeather = CurrentWeather(weatherDictionary: weatherDictionary as [String : AnyObject])
        
        XCTAssertEqual(currentWeather.temperature, 60)
        XCTAssertEqual(currentWeather.precipitation, 20)
        XCTAssertEqual(currentWeather.summary, "partly cloudy")
        XCTAssertEqual(currentWeather.humidity, 68)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
