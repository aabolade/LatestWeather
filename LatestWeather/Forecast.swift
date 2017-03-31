//
//  Forecast.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import Foundation

struct Forecast {
    
    var currentWeather: CurrentWeather?
    
    init(forecastDictionary: [String: AnyObject]?, locationDictionary: [String: AnyObject]?) {
        if let unwrappedForecastDictionary = forecastDictionary?["currently"] as? [String : AnyObject], let unwrappedLocationDictionary = locationDictionary?["results"] as? [[String : AnyObject]] {
            currentWeather = CurrentWeather(weatherDictionary: unwrappedForecastDictionary, locationDictionary: unwrappedLocationDictionary)
        }
    }
}
