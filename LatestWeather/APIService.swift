//
//  APIService.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    typealias JSONDictionaryCompletion = (Forecast?) -> Void
    
    func getWeatherJSON(_ latitude: Double, longitude: Double, completion: @escaping JSONDictionaryCompletion) {
        
        let clientKeys = ClientKeys()
        let weatherApiKey = clientKeys.valueForAPIKey(named: "API_CLIENT_ID")
        let locationApiKey = clientKeys.valueForAPIKey(named: "GOOGLE_PLACES")
        
        Alamofire.request("https://api.darksky.net/forecast/\(weatherApiKey)/\(latitude),\(longitude)").responseJSON { response in
            
            guard let weatherJSON = response.result.value as? [String: AnyObject] else {
                print("There is no weather data")
                return
            }
            
            Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?latlng=\(latitude),\(longitude)&result_type=locality&key=\(locationApiKey)").responseJSON { response in
                guard let locationJSON = response.result.value as? [String:AnyObject] else {
                    print("There is no location data")
                    return
                }
                let forecast = Forecast(forecastDictionary: weatherJSON, locationDictionary: locationJSON)
                completion(forecast)
            }
        }
    }

}
