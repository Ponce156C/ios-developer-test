//
//  car.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 06/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation

struct Car {
    
    enum carType {
        case resident
        case noresident
        case oficial
    }
    
    let id: Int
    let plate: String
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
