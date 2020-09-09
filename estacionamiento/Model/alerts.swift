//
//  alerts.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 09/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    var title: String = "Ocurrio un problema"
    var message: String = "Favor de intentar mas tarde"
    var buttonAcept: String = "ACEPTAR"
    var buttonOpcional: String = "CANCELAR"
    
    func showAlert(_ title: String?,_ message: String?,_ buttonAcept: String?,_ buttonOpcional: String?,_ viewController: UIViewController) {
        self.title = title != nil ? title! : self.title
        self.message = message != nil ? message! : self.message
        self.buttonAcept = buttonAcept != nil ? buttonAcept! : self.buttonAcept
        self.buttonOpcional = buttonOpcional != nil ? buttonOpcional! : self.buttonOpcional
        
        let alertController = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: self.buttonAcept, style: .default, handler: nil))
        if buttonOpcional != nil {
            alertController.addAction(UIAlertAction(title: self.buttonOpcional, style: .cancel, handler: nil))
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertAcept(_ viewController: UIViewController) {
        let alertController = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: self.buttonAcept, style: .default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    deinit {
        print("clean memory - alert")
    }
}
