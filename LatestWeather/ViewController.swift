//
//  ViewController.swift
//  LatestWeather
//
//  Created by Leke Abolade on 12/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getCurrentWeather() {
        apiService.getWeatherJSON() { (forecast) in
            
            if let unwrappedForecast = forecast,
                let unwrappedCurrentWeather = unwrappedForecast.currentWeather {
                print(unwrappedCurrentWeather.humidity)
            }
        }
    }

}

