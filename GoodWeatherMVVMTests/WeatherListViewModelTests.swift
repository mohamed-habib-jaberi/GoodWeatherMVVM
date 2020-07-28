//
//  WeatherListViewModelTests.swift
//  GoodWeatherMVVMTests
//
//  Created by mohamed  habib on 28/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import XCTest
@testable import GoodWeatherMVVM

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel: WeatherListViewModel!
    
    override func setUp() {
        self.weatherListViewModel = WeatherListViewModel()
        self.weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Houston", currentTemperature: TemperatureViewModel(temperature: 32, temperatureMin: 20.0, temperatureMax: 40.0)))
        self.weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Houston", currentTemperature: TemperatureViewModel(temperature: 72, temperatureMin: 20.0, temperatureMax: 40.0)))
    }

    func test_should_be_able_convert_to_celsuis_successfully()  {
            
        let celsuisTemperature = [0, 22.222]
        self.weatherListViewModel.updateUnit(to: .celsius)
        
        for (index, vm) in self.weatherListViewModel.weatherViewModels.enumerated(){
            XCTAssertEqual(round(vm.currentTemperature.temperature), round(celsuisTemperature[index]) )
        }
    }
    
    override func tearDown() {
      
    }

    

}
