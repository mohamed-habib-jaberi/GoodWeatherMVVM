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
        
        setUpBinding()
    }
    
    private func setUpBinding(){
        
        if let weatherVM = self.weatherViewModel{
            weatherVM.name.bind{ self.cityNameLabel.text = $0}
            weatherVM.currentTemperature.temperature.bind{ self.currentTemperatureLabel.text = $0.formatAsDegree}
            weatherVM.currentTemperature.temperatureMin.bind{ self.minTempLabel.text = $0.formatAsDegree}
            weatherVM.currentTemperature.temperatureMax.bind{ self.maxTempLabel.text = $0.formatAsDegree}
        }
        
        // change the value after few seconds
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.weatherViewModel?.name.value = "change after 2 second : Boston"
        }
    }
}
