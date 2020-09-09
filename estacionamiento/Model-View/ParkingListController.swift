//
//  ParkingListController.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 05/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class ParkingListController: UITableViewController {
    
    var Cars: [Car] = [
        Car(id: 1, plate: "ASD123Q1", type: .resident, accumulatedTime: 60, startDate: Date()),
        Car(id: 2, plate: "ZXC345S1", type: .resident, accumulatedTime: 60, startDate: Date()),
        Car(id: 3, plate: "VRD123B9", type: .noresident, accumulatedTime: 60, startDate: Date()),
        Car(id: 3, plate: "NEY196V4", type: .noresident, accumulatedTime: 54, startDate: Date()),
        Car(id: 3, plate: "BTE516H4", type: .oficial, accumulatedTime: 54, startDate: Date()),
        Car(id: 3, plate: "NTF123B9", type: .oficial, accumulatedTime: 54, startDate: Date())
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lista de autos"
         self.clearsSelectionOnViewWillAppear = true
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Cars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCellID", for: indexPath) as! CarCell
        cell.setupCarItem(Cars[indexPath.row])
        return cell
    }

    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "details") as DetailsController
        viewController.car = Cars[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
