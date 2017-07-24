//
//  Car.swift
//  HomeWork3
//
//  Created by Роман on 15.07.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import Foundation
import UIKit

class Car {
    
    var make: String
    var model: String
    var year: String
    var description: String
    var logo: UIImage
    
    init(make: String, model: String, year: String, description: String, logo: UIImage) {
        self.make = make
        self.model = model
        self.year = year
        self.description = description
        self.logo = logo
    }
    
}
