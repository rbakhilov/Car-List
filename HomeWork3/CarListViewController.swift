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
        tableView.dataSource = self

        // Do any additional setup after loading the view.
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createNewCarsSegue" {
            let nextVC = segue.destination as! ViewController
            nextVC.delegate = self
        }
    }
    
    func onCreatedNew(car: Car) -> Void {
        cars.append(car)
        tableView.reloadData()
    }
}
