//
//  SettingsTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 24/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingsDone(_ vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Action
    @IBAction func done(){
        
        if let delegate = self.delegate {
                delegate.settingsDone(self.settingsViewModel)
            }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        let settingsItem = self.settingsViewModel.units[indexPath.row]
        
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == self.settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // uncheck all cells
        tableView.visibleCells.forEach { (cell) in
            cell.accessoryType = .none
        }
       
        if let cell = self.tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            
            // Persisting Unit in User Defaults
            let unit = Unit.allCases[indexPath.row]
            self.settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    
}
