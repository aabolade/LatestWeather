//
//  Weather.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import Foundation

struct Weather {
    
    let temperature: String?
    let humidity: String?
    let summary: String?
    let precipitation: String?
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? String
        humidity = weatherDictionary["humidity"] as? String
        summary = weatherDictionary["summary"] as? String
        precipitation = weatherDictionary["precipProbability"] as? String
    }
}
