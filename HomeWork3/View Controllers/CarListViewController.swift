//
//  CarListViewController.swift
//  HomeWork3
//
//  Created by Роман on 15.07.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController, UITableViewDataSource, AddNewCarDelegate, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

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
        cell.descriptionLabel.text = car.description
        cell.logoLabel.image = car.logo
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
