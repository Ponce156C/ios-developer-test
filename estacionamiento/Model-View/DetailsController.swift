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
    @IBOutlet weak var stopTimer: UIButton! {
        didSet {
            stopTimer.titleLabel?.text = "DETENER"
            stopTimer.layer.cornerRadius = 10
            stopTimer.backgroundColor = UIColor(named: "Buttons")
        }
    }
    
    var parkingController: ParkingListController?
    var car: Car?
    let alert = Alert()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.type.text = setType()
        self.plate.text = car?.plate
        self.startDate.text = getDateWithFormatter()
        car?.setAccumulatedTime()
        self.payment.text = "$\(car?.getPayment() ?? 0.0)"
    }
    
    func getDateWithFormatter() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.string(from: car?.startDate ?? Date())
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
    
    @IBAction func payTicketAction(_ button: UIButton) {
        alertToPay()
    }
    
    func alertToPay() {
        let alertController = UIAlertController(title: "¿Deseas pagar el ticket?", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ACEPTAR", style: .default, handler: { (action) -> Void in
            self.payTicket()
        }))
        alertController.addAction(UIAlertAction(title: "CANCELAR", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func payTicket() {
        guard (car != nil) else {
            alert.showAlertAcept(self)
            return
        }
        self.parkingController?.cars.cars = self.parkingController?.cars.cars?.filter() {$0.plate != car!.plate}
        self.parkingController?.tableView.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    deinit {
        print("clean memory - Details")
    }
}
