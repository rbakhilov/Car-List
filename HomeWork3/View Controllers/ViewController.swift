//
//  ViewController.swift
//  HomeWork3
//
//  Created by Роман on 14.07.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var logoImageAdd: UIImageView!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var carYear: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    weak var delegate: AddNewCarDelegate?
    var carEdit: Car?
    var imagePicker = UIImagePickerController()
    var year = Array(1950...2017).map { String($0) }
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        
        if let carEdit = carEdit {
            makeTextField.text = carEdit.make
            modelTextField.text = carEdit.model
            carYear.text = carEdit.year
            descriptionTextField.text = carEdit.description
            logoImageAdd.image = carEdit.logo
            
        }
        
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        carYear.inputView = picker
    }
    
    @IBAction func onTouchImageAdd(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
     }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            logoImageAdd.image = image
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onTouchSaveData(_ sender: UIButton) {
        
        var car: Car
        
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
        
        guard let description = descriptionTextField.text, !model.isEmpty else {
            showAlert(with: "Fill description")
            return
        }
        
        guard let logo = logoImageAdd.image, !model.isEmpty else {
            showAlert(with: "Fill image")
            return
        }
        
        
        
        print("Make: \(make)")
        print("Model: \(model)")
        print("Year: \(year)")
        print("Description: \(description)")
        
        if let carEdit = carEdit {
            car = carEdit
            car.make = make
            car.model = model
            car.year = year
            car.logo = logo
            car.description = description
            delegate?.reloadData()
        } else {
        
            let car = Car(make: make, model: model, year: year, description: description, logo: logo)
        delegate?.onCreatedNew(car: car)
        }
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

