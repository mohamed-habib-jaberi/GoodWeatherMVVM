//
//  WeatherDetailsViewController.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 25/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import Foundation

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // solution normal: not binding ViewModel to View
        if let weather = self.weatherViewModel {
    
            self.cityNameLabel.text = weather.name.value
            self.currentTemperatureLabel.text = weather.currentTemperature.temperature.value.formatAsDegree
            self.maxTempLabel.text =  "\(weather.currentTemperature.temperatureMax.value.formatAsDegree)"
            self.minTempLabel.text =  "\(weather.currentTemperature.temperatureMin.value.formatAsDegree)"
        }
    }
}
