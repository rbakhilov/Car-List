//
//  CarListViewController.swift
//  HomeWork3
//
//  Created by Роман on 15.07.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource, AddNewCarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bmwX5 = Car(make: "BMW", model: "X5", year: "2016")
        let bmwX6 = Car(make: "BMW", model: "X6", year: "2017")
        cars.append(bmwX5)
        cars.append(bmwX6)


        tableView.dataSource = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        let car = cars[indexPath.row]
        cell.makeLabel.text = car.make
        cell.modelLabel.text = car.model
        cell.yearLabel.text = car.year
        
        return cell
    }
    
    func onCreatedNew(car: Car) -> Void {
        cars.append(car)
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createCarSegue" {
            let nextVC = segue.destination as! ViewController
            nextVC.delegate = self
        } else if segue.identifier == "editCarSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let nextVC = segue.destination as! ViewController
                nextVC.delegate = self
                nextVC.carEdit = cars[indexPath.row]
                
            }
        }
    }
}
