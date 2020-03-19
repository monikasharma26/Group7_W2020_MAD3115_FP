//
//  Car.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Car: Vehicle
{
    var vehicleIdentificationNumber: String
       
       var vehicleDescription: String
       
       var manufacturerName: String
       
       var isSelfDrive: Bool
       
       var isInsured: Bool
       
       var noOfSeat: Int
       
       var fuelType: String
       
       var vehicleType: VehicleT
       
       
      // var carType: CarType?
       
       var carColor: String
       
    //   var baseRate : Int
     //  var ratePerKm : Int
       var details: VehicleRentM?
    
init(vehicleIdentificationNumber:String,vehicleDescription:String,manufacturerName: String,isSelfDrive:Bool,isInsured: Bool,noOfSeat:Int,seat: Int, fuelType: String,vehicleType:VehicleT, carColor: String)
  {
              self.vehicleIdentificationNumber = vehicleIdentificationNumber
              self.vehicleDescription = vehicleDescription
              self.manufacturerName = manufacturerName
              self.isSelfDrive = isSelfDrive
              self.isInsured = isInsured
              self.noOfSeat = noOfSeat
              self.fuelType = fuelType
            self.vehicleType = vehicleType
         //   self.baseRate = baseRate
          //  self.ratePerKm = ratePerKm
          self.carColor = carColor
       //   self.carType = carType
  }
