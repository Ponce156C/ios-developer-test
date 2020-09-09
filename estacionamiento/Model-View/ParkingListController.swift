//
//  ParkingListController.swift
//  estacionamiento
//
//  Created by Carlos Ponce on 05/09/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class ParkingListController: UITableViewController {
    
    var cars = Cars()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars.appendToCars(Car(id: 1, plate: "ZXC345S1", type: .resident, accumulatedTime: 0, startDate: Date().addingTimeInterval(-60*10)), self)
        cars.appendToCars(Car(id: 3, plate: "VRD123B9", type: .noresident, accumulatedTime: 0, startDate: Date().addingTimeInterval(-60*100)), self)
        
        navigationItem.title = "Lista de autos"
         self.clearsSelectionOnViewWillAppear = true
    }
    
    @IBAction func addCarController(_ tabButton: UIBarButtonItem) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "add") as addCarController
        viewController.parkingListController = self
        navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cars.cars?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCellID", for: indexPath) as! CarCell
        cell.setupCarItem(cars.cars![indexPath.row])
        return cell
    }

    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "details") as DetailsController
        viewController.parkingController = self
        viewController.car = cars.cars![indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
