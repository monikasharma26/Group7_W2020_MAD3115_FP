//
//  VehicleM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
struct VehicleM : Codable {
   let vehicleIdentificationNumber, vehicleDescription, manufacturerName: String
      let isSelfDrive, isInsured: Bool
      let noOfSeat: Int
      let fuelType : String
      let topSpeed: Int = 0
      let mileage : Int = 0
      var vehicleType : VehicleT?
      let vehicleRent : VehicleRentM?
}
enum VehicleT: String, Codable {
    case car = "Car", motorcycle = "Motorcycle" , bus = "Bus"
}
