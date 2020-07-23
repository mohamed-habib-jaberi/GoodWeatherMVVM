//
//  TemperatureViewModel.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

// MARK: - TemperatureViewModel
struct TemperatureViewModel : Decodable {
    
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
}
