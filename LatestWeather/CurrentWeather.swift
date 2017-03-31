//
//  Weather.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import Foundation

enum dictionaryKeys: String {
    case temperature = "temperature"
    case humidity = "humidity"
    case precipitation = "precipProbability"
    case summary = "summary"
}

struct CurrentWeather {
    
    var temperature: Int?
    let humidity: Int?
    let summary: String?
    let precipitation: Int?
    let location: String?
    
    init(weatherDictionary: [String: AnyObject], locationDictionary: [[String:AnyObject]]) {
       
        if let humidityDouble = weatherDictionary[dictionaryKeys.humidity.rawValue] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        if let precipitationDouble = weatherDictionary[dictionaryKeys.precipitation.rawValue] as? Double {
            precipitation = Int(precipitationDouble * 100)
        } else {
            precipitation = nil
        }
        summary = weatherDictionary[dictionaryKeys.summary.rawValue] as? String
        
       location = locationDictionary[0]["formatted_address"] as? String
        
        if let temperatureDouble = weatherDictionary[dictionaryKeys.temperature.rawValue] as? Double {
            temperature = convertToDegreesCelsius(temperature: temperatureDouble)
        } else {
            temperature = nil
        }
    }
    
    func convertToDegreesCelsius(temperature: Double) -> Int {
        let temperatureDouble = (temperature - 32)/1.8
        return Int(temperatureDouble.rounded())
    }
    
    
}
