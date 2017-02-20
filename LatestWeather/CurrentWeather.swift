//
//  Weather.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int?
    let humidity: Int?
    let summary: String?
    let precipitation: Int?
    
    init(weatherDictionary: [String: AnyObject]) {
        if let temperatureInt = weatherDictionary["temperature"] as? Int {
            temperature = temperatureInt
        } else {
            temperature = nil
        }
        if let humidityDouble = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        if let precipitationDouble = weatherDictionary["precipProbability"] as? Double {
            precipitation = Int(precipitationDouble * 100)
        } else {
            precipitation = nil
        }
        summary = weatherDictionary["summary"] as? String
    }
}
