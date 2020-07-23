//
//  AddWeatherCityViewController.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func close(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
   @IBAction func save(_ sender: Any) {
       
    if let city = self.cityNameTextField.text {
             let weatherURL = URL(string: "https://openweathermap.org/data/2.5/weather?q=\(city)&appid=439d4b804bc8187953eb36d2a8c26a02&units=imperial")!
        
        let weatherRessource = Ressource<WeatherViewModel>(url: weatherURL) { data in
            
            let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
            
            return weatherVM
        }
        
        WebServices().load(ressource: weatherRessource) { result in
            
        }
    }
   }
}
