//
//  Double+Extensions.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 24/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String{
        
        return String(format: "%.0f°", self)
    }
}
