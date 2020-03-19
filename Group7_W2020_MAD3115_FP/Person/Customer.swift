//
//  Customer.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Customer
{
    var address : String?
    var city : String?
    var vehicle: VehicleM?
     var vehicleListRented = [Int : VehicleRent]()
     var amountToPayForAllRentedVehicles : Float = 0.0
}
