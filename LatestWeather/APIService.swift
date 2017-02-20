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
    
    func getWeatherJSON(_ completion: @escaping JSONDictionaryCompletion) {
        
        let clientKeys = ClientKeys()
        let apiKey = clientKeys.valueForAPIKey(named: "API_CLIENT_ID")
        
        Alamofire.request("https://api.darksky.net/forecast/\(apiKey)/42.3601,-71.0589").responseJSON { response in
            
            guard let JSON = response.result.value as? [String: AnyObject] else {
                print("There is no data")
                return
            }
            let forecast = Forecast(forecastDictionary: JSON)
            completion(forecast)
        }
    }
}
