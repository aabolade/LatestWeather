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
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getCurrentWeather() {
        apiService.getWeatherJSON() { (forecast) in
            
            if let forecast = forecast,
                let unwrappedCurrentWeather = forecast.currentWeather {
                
                if let summary = unwrappedCurrentWeather.summary {
                    self.summaryLabel.text = summary
                }
                
                if let temperature = unwrappedCurrentWeather.temperature {
                 self.temperatureLabel.text = "\(temperature)°C"
                }
                
                if let humidity = unwrappedCurrentWeather.humidity {
                    self.humidityLabel.text = "\(humidity)%"
                }
                
                if let precipitation = unwrappedCurrentWeather.precipitation {
                    self.precipitationLabel.text = "\(precipitation)%"
                }
            }
        }
    }

}

