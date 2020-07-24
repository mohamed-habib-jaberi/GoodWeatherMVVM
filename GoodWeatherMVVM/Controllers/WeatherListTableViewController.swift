//
//  WeatherListTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate{
    
    
   private var weatherListViewModel = WeatherListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - AddWeatherDelegate
    func addWeatherDidSave(vm: WeatherViewModel) {
        print("*********")
        print(vm.name)
        print("*********")
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation controller not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController  else {   fatalError("addWeatherCityVC controller not found")
        }
        addWeatherCityVC.delegate = self
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numbersOfRows(section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.setupCell(vm: weatherVM)
        return cell
    }
}
