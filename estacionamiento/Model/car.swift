//
//  car.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 06/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation

struct Car: Equatable {
    
    enum carType {
        case resident
        case noresident
        case oficial
    }
    
    let id: Int
    var plate: String
    var type: carType
    var accumulatedTime: Int
    var startDate: Date
    
    mutating func setAccumulatedTime() {
        let differenceTime = Calendar.current.dateComponents([.minute], from: startDate, to: Date())
        print(differenceTime)
        accumulatedTime += differenceTime.minute ?? 0
        startDate = Date()
    }
    
    func getPayment() -> Double {
        switch self.type {
        case .resident:
            return Double(accumulatedTime) * 0.05
        case .noresident:
            return Double(accumulatedTime) * 0.5
        case .oficial:
            return 0.0
        }
    }
}

class Cars {
    
    var cars: [Car]?
    
    func appendToCars(_ car: Car) {
        if cars != nil {
            var hasCar = false
            cars?.forEach({ (carValue) in
                if carValue.plate == car.plate {
                    hasCar = true
                    return
                }
            })
            if !hasCar {
                cars?.append(car)
            }
            return
        }
        cars = [car]
        return
    }
}
