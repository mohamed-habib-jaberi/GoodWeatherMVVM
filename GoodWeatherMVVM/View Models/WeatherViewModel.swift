//
//  WeatherViewModel.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation


// MARK: - WeatherViewModel
struct WeatherViewModel : Decodable {
    
    let name: String
    var currentTemperature: TemperatureViewModel
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case currentTemperature = "main"
        
    }
    
}
