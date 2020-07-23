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
    
    let temperature : Double
    let temperatureMin : Double
    let temperatureMax : Double
       
}
