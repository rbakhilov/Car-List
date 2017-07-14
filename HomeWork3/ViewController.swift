//
//  ViewController.swift
//  HomeWork3
//
//  Created by Роман on 13.07.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var carYear: UITextField!
    
    weak var delegate: AddNewPersonDelegate?

    var year = Array(1950...2017).map { String($0) }
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        carYear.inputView = picker
    }
    
    @IBAction func onTouchSaveData(_ sender: UIButton) {
        print("OnTouch Save data")
        
        guard let make = makeTextField.text, !make.isEmpty else {
            showAlert(with: "Fill make")
            return
        }
        
        guard let model = modelTextField.text, !model.isEmpty else {
            showAlert(with: "Fill model")
            return
        }
        
        guard let year = carYear.text, !year.isEmpty else {
            showAlert(with: "Fill year")
            return
        }
        
        print("Make: \(make)")
        print("Model: \(model)")
        print("Year: \(year)")
        
        let car = Car(make: make, model: model, year: year)
        delegate?.onCreatedNew(car: car)
        navigationController?.popViewController(animated: true)


    }
    
    func showAlert(with title: String) {
        print(title)
        let alert = UIAlertController(title: "Error", message: title,
                                      preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { (action: UIAlertAction) in
            print("Ok button tapped")
        }
        alert.addAction(actionOk)
        
        present(alert, animated: true, completion: nil)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return year.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return year[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        carYear.text = year[row]
        self.view.endEditing(false)
    }

}

