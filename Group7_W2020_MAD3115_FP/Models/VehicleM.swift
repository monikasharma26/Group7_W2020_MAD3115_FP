//
//  VehicleM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
struct VehicleM : Codable {
   var vehicleIdentificationNumber, vehicleDescription, manufacturerName: String?
      var isSelfDrive, isInsured: Bool?
      var noOfSeat: Int?
      var fuelType,carType,carColor : String?
      var topSpeed: Int?
      var mileage : Int?
        var vehicleType   : VehicleT?
        var ptype : OptionSelected?
      var vehicleRent : VehicleRentM?
}
enum VehicleT: String, Codable {
    case car = "Car", motorcycle = "Motorcycle" , bus = "Bus"
}
enum OptionSelected: String,Codable
{
    case Customers = "Customers" 
    case Owner = "Owner"
    case Driver = "Driver"
}
