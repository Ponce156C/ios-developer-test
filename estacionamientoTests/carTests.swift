//
//  carTest.swift
//  estacionamientoTests
//
//  Created by Carlos Ponce on 08/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import XCTest
@testable import estacionamiento

class carTests: XCTestCase {

    var car: Car = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateTest = formatter.date(from: "2020/09/09 01:23") ?? Date()
        
        return Car(id: 1, plate: "ASD12S", type: .resident, accumulatedTime: 0, startDate: dateTest)
    }()

    func testAccumulatedTime() {
        car.setAccumulatedTime()
        XCTAssertEqual(car.accumulatedTime, 15)
    }
    
    func testGetPayment() {
        self.testAccumulatedTime()

        XCTAssertEqual(car.getPayment(), 0.75)
        
        var carNoResident = car
        carNoResident.type = .noresident
        XCTAssertEqual(carNoResident.getPayment(), 7.5)
        
        var carOficial = car
        carOficial.type = .oficial
        XCTAssertEqual(carOficial.getPayment(), 0)
    }
    
}
