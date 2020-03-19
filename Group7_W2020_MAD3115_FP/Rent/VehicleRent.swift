//
//  VehicleRent.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

enum vehicleType1{
    case Car
    case MotorCycle
    case Bus
}

class VehicleRent
{
     var vehicleRentID : Int?
        var rentStartDate : String
        var rentEndDate : String
       var rentInNumberOfDays : Float = 0.0
        var vehicles = [String: Vehicle]()
        var vehicleTy : VehicleT?
        var rentedDays : Int = 0
        var kmdrive : Int = 0
        var rentInKm : Float = 0.0
        let sDate:String = "12/01/2020"
    let eDate: String = "18/01/2020"
        var vehicleListRented = [Int : VehicleRent]()
        var amountToPayForAllRentedVehicles : Float = 0.0
public var totalBillToPay : Float
 {
         return TotalFare()
 }
public  var totalAmount: Float = 0.0
 public  var total: Float = 0.0
 var totalFare: Float = 0.0

