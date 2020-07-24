//
//  SettingsViewModel.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 24/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation


//MARK: Unit Enum

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

// Display in TableView Celsius and Fahrenheit
extension Unit {
    
    var displayName: String {
        get{
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            
            }
        }
    }
    
}

struct SettingsViewModel {
    
    // Display value in tableview
    let units = Unit.allCases
    
    private var _selectedUnit: Unit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }set{
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
