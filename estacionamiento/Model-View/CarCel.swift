//
//  CarCell.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 05/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet weak var plate: UILabel!
    @IBOutlet weak var iconCar: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupCarItem(_ car: Car) {
        switch car.type {
        case .resident:
            iconCar.text = "🚙"
        case .noresident:
            iconCar.text = "🚗"
        case .oficial:
            iconCar.text = "🚓"
        }
        plate.text = car.plate
        timer.text = "\(car.accumulatedTime)"
    }
    
    deinit {
        print("space free")
    }
}
