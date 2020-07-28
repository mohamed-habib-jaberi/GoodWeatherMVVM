//
//  SettingsViewModelTests.swift
//  GoodWeatherMVVMTests
//
//  Created by mohamed  habib on 27/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import XCTest
@testable import GoodWeatherMVVM


class SettingsViewModelTests: XCTestCase {
    
    private var settingsVM: SettingsViewModel?

    override func setUp() {

    }

    override func tearDown() {
     
    }

    func test_should_make_sure_that_default_selected_unit_is_fahrenheit() {
  
        if let vm = self.settingsVM {
           XCTAssertEqual(vm.selectedUnit, Unit.fahrenheit)
        }
    }
    
    func test_should_return_correct_display_name_for_fahrenheit() {
        if let vm = self.settingsVM {
            XCTAssertEqual(vm.selectedUnit.displayName, "fahrenheit" )
               }
       
    }
    
    func test_should_be_able_to_save_user_unit_selection()  {
        self.settingsVM?.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override class func tearDown() {
        super.tearDown()
            let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
