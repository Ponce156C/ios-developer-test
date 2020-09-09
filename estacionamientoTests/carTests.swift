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
        let dateTest = Date().addingTimeInterval(-60*15)
        
        return Car(id: 1, plate: "ASD12S", type: .resident, accumulatedTime: 0, startDate: dateTest)
    }()

    func testAccumulatedTime() {
        print(car)
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

    func testAppendToCars() {
        let cars = Cars()
        cars.appendToCars(car)
        XCTAssertEqual(cars.cars, [car])
    }
    
    func testAppendToCarWithrRepetition() {
        let cars = Cars()
        cars.appendToCars(car)
        cars.appendToCars(car)
        cars.appendToCars(car)
        XCTAssertEqual(cars.cars, [car])
    }
    
    func testAppendToCarsNoRepetition() {
        let cars = Cars()
        var car2 = car
        car2.plate = "ASDDQWE"
        cars.appendToCars(car)
        cars.appendToCars(car2)
        XCTAssertEqual(cars.cars, [car, car2])
    }

}
