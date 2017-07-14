//
//  AddNewCarDelegate.swift
//  HomeWork3
//
//  Created by Роман on 15.07.17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import Foundation

protocol AddNewCarDelegate: class {
    
    func onCreatedNew(car: Car) -> Void
    
}
