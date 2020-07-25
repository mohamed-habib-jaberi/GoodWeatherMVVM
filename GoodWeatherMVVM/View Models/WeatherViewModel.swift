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
    
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case currentTemperature = "main"
        
    }
    
    init(from decoder:Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
        
    }
}

//type eraser

class Dynamic<T>: Decodable where T: Decodable {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener)  {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    enum CodingKeys: CodingKey {
        case value
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       value = try values.decode(T.self, forKey: .value)
    }
   
}
