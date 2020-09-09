//
//  protocols.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 08/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation
import UIKit

protocol CarProtocol {
    var accumulatedTime: Int {get set}
    var startDate: Date {get set}
    mutating func setAccumulatedTime()
}

protocol detailsCarProtocol {
    var car: Car? {get set}
}
