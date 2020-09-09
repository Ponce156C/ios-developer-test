//
//  DetailsController.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 08/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class DetailsController: UIViewController, detailsCarProtocol {
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var plate: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var payment: UILabel!
    @IBOutlet weak var pay: UIButton! {
        didSet{
            pay.titleLabel?.text = "PAGAR"
            pay.layer.cornerRadius = 10
            pay.backgroundColor = UIColor(named: "Buttons")
        }
    }
    
    var car: Car?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.type.text = setType()
        self.plate.text = car?.plate
        self.startDate.text = "12 12 12"
        self.payment.text = "$\(car?.getPayment() ?? 0.0)"
    }
    
    func setType() -> String {
        guard let carType = car?.type else {
             return "🚗 No Residente"
        }
        switch carType {
            case .resident:
                return  "🚙 Residente"
            case .noresident:
                return "🚗 No Residente"
            case .oficial:
                return "🚓 No Residente"
        }
    }
}
