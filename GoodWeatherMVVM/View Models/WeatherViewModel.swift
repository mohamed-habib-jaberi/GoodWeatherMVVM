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
    
    enum codingKeys: CodingKey {
        case value
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
       value = try values.decode(T.self, forKey: .value)
    }
   
}
