//
//  car.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 06/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
    
    func appendToCars(_ car: Car,_ viewController: UIViewController) {
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
                return
            }
            Alert().showAlert("Ocurrio un problema", "El automovil que desea registrar ya se encuentra en la base de datos", "Aceptar", nil, viewController)
            return
        }
        cars = [car]
        return
    }
    
    
    func getNextID() -> Int {
        var maxElement = cars?.first?.id ?? 1
        cars?.forEach({ (car) in
            if car.id > maxElement {
                maxElement = car.id
            }
        })
        return maxElement == 1 ? 1 : maxElement + 1
    }
    
    func getIntoCoreData(_ viewController: UIViewController) {
        let fetchRequestCars = NSFetchRequest<NSFetchRequestResult>.init(entityName: "CarsData")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        do{
            let resultCars = try managerContext.fetch(fetchRequestCars)
            resultCars.forEach { (item) in
                guard let id = (item as AnyObject).value(forKey: "id") as? Int else {return}
                guard let plate = (item as AnyObject).value(forKey: "plate") as? String else {return}
                guard let type = (item as AnyObject).value(forKey: "type") as? String else {return}
                guard let accumulatedTime = (item as AnyObject).value(forKey: "accumulatedTime") as? Int else {return}
                guard let startDate = (item as AnyObject).value(forKey: "startDate") as? Date else {return}
                
                let car = Car(id: id, plate: plate, type: getType(type), accumulatedTime: accumulatedTime, startDate: startDate)
                self.appendToCars(car, viewController)
            }
        }catch {
            print("Error")
        }
    }
    
    func appendIntoCoreData( ) {
        
    }
    
    func deleteIntoCoreData() {
        
    }
    
    func getType(_ type: String) -> Car.carType {
        switch type {
        case "resident":
            return .resident
        case "noresident":
            return .noresident
        case "oficial":
            return .oficial
        default:
            return .noresident
        }
    }
    
    deinit {
        print("Clean memory - Cars")
    }
}
