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
    var temperature: Double
    var temperatureMin: Double
    var temperatureMax: Double
   
 
}
