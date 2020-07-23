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
       
   }
}
