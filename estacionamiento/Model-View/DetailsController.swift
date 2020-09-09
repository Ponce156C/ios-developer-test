//
//  DetailsController.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 08/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var plate: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var payment: UILabel!
    
    var car: Car?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let carType = car?.type else {
            self.type.text = "🚗 No Residente"
            return
        }
        switch carType {
        case .resident:
            self.type.text = "🚙 Residente"
        case .noresident:
            self.type.text = "🚗 No Residente"
        case .oficial:
            self.type.text = "🚓 No Residente"
        }
        self.plate.text = car?.plate
        self.startDate.text = "12 12 12"
        self.payment.text = "$\(car?.getPayment() ?? 0.0)"
    }
}
