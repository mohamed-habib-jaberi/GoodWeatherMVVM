//
//  WeatherCell.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {


    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(vm: WeatherViewModel)  {
        self.cityNameLabel.text = vm.name
        self.temperatureLabel.text = "\(vm.currentTemperature.temperature.formatAsDegree)"
    }
}
