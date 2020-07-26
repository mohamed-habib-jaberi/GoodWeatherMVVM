//
//  WeatherDataSource.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 26/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    var cellIdentifier : String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init( weatherListViewModel: WeatherListViewModel) {
        
        self.weatherListViewModel = weatherListViewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else { fatalError(" \(self.cellIdentifier) not found") }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
         cell.setupCell(vm: weatherVM)
        return cell
    }
    
    
    
}
