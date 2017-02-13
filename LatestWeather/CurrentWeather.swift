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
        if let temperatureString = weatherDictionary["temperature"] as? String {
            temperature = Int(temperatureString)
        } else {
            temperature = nil
        }
        if let humidityString = weatherDictionary["humidity"] as? String,
            let humidityDouble = Double(humidityString) {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        if let precipitationString = weatherDictionary["precipProbability"] as? String,
            let precipitationDouble = Double(precipitationString) {
            precipitation = Int(precipitationDouble * 100)
        } else {
            precipitation = nil
        }
        summary = weatherDictionary["summary"] as? String
    }
}
