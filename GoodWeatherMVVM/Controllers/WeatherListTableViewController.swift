//
//  WeatherListTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController{
    
    
    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = WeatherDataSource(weatherListViewModel: self.weatherListViewModel)
        self.tableView.dataSource = self.dataSource
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            
            self.prepareSegueForAddWeatherCityViewController(segue: segue)
            
        }else if segue.identifier == "SettingsTableViewController" {
            
            self.prepareSegueForSettingsTableViewController(segue: segue)
        }
        
    }
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation controller not found")
        }
        
        guard let settingsTableVC = nav.viewControllers.first as? SettingsTableViewController  else {   fatalError("SettingsTableViewController  not found")
        }
        settingsTableVC.delegate = self
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation controller not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController  else {   fatalError("addWeatherCityVC controller not found")
        }
        addWeatherCityVC.delegate = self
    }
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

// MARK: - SettingsDelegate
extension WeatherListTableViewController : SettingsDelegate {
    
    func settingsDone(_ vm: SettingsViewModel) {
        print("settings done ")
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}

// MARK: - AddWeatherDelegate
extension WeatherListTableViewController : AddWeatherDelegate{
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print("*********")
        print(vm.name)
        print("*********")
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
        
    }
}
