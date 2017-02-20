//
//  ViewController.swift
//  LatestWeather
//
//  Created by Leke Abolade on 12/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var apiService = APIService()
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getCurrentWeather(location: CLLocationCoordinate2D) {
        apiService.getWeatherJSON(location.latitude,longitude: location.longitude) { (forecast) in
            
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        manager.stopUpdatingLocation()
        getCurrentWeather(location: userLocation.coordinate)
    }
    
    @IBAction func getWeather() {
    }
    

}

