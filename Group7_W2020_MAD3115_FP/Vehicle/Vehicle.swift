//
//  Vehicle.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

protocol Vehicle {
    
 var vehicleIdentificationNumber: String {get set}
    var vehicleDescription: String {get set}
    var manufacturerName: String    {get set}
    var isSelfDrive: Bool            {get set}
    var isInsured: Bool               {get set}
    var noOfSeat: Int                   {get set}
    var fuelType: String     {get set}
    var vehicleType: VehicleT  {get set}

}
    

