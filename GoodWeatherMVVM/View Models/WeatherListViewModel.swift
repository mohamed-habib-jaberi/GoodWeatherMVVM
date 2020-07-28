//
//  WeatherListViewModel.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

// MARK: - WeatherListViewModel
struct WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        
        self.weatherViewModels.append(vm)
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> (WeatherViewModel) {
        
        return self.weatherViewModels[index]
    }
    
    private mutating func toCelsius() {
       weatherViewModels = weatherViewModels.map { vm in
            
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
            return weatherModel
        }
    }
    private mutating func toFahrenheit()  {
           weatherViewModels = weatherViewModels.map { vm in
               
               var weatherModel = vm
               weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5 ) + 32
               return weatherModel
           }
       }
    mutating func updateUnit(to unit: Unit)  {
        
        switch unit {
          case .celsius:
              toCelsius()
          case .fahrenheit:
             toFahrenheit()
        }
    }
}
