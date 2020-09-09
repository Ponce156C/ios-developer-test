//
//  addCarController.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 09/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class addCarController: UIViewController {
    
    @IBOutlet weak var plate: UITextField!
    @IBOutlet weak var type: UISegmentedControl!
    @IBOutlet weak var add: UIButton! {
        didSet {
            add.layer.cornerRadius = 10
        }
    }
    
    var parkingListController: ParkingListController?
    let alert = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plate.delegate = self
    }
    
    @IBAction func addCar(_ segmented: UIButton) {
        guard let plateText = plate.text else {
            alert.showAlertAcept(self)
            return
        }
        if plateText.count >= 5  {
            let car = Car(id: parkingListController?.cars.getNextID() ?? 1, plate: plateText, type: getTypeSelected(), accumulatedTime: 0, startDate: Date())
            parkingListController?.cars.appendToCars(car, self)
            parkingListController?.tableView.reloadData()
            self.navigationController?.popViewController(animated: true)
            
        }else {
            alert.showAlert("Datos inválidos", "La cantidad de caracteres tienen que ser mayor a 5", "ACEPTAR", nil, self)
        }
    }
    
    func getTypeSelected() -> Car.carType {
        switch type.selectedSegmentIndex {
        case 0:
            return .resident
        case 1:
            return .noresident
        default:
            return .oficial
        }
    }
    deinit {
        print("clean memory - addCarController")
    }
}

extension addCarController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn:"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
        let components = string.components(separatedBy: allowedCharacters)
        let filtered = components.joined(separator: "")

        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        return string == filtered ? newText.count <= 8 ? true: false : false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.resignFirstResponder()
    }
}
