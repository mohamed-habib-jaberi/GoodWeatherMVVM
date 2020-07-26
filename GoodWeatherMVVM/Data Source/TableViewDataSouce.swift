//
//  TableViewDataSouce.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 26/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSouce<CellType,ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    
    
    let cellIdentifier: String
    let items : [ViewModel]
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()  ) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else { fatalError("cell with identifier \(self.cellIdentifier) not found  ") }
        
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        
        
        return cell
    }
    
    
    
    
}
