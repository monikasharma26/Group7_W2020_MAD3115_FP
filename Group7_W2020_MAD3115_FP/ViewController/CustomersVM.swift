//
//  CustomersVM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-22.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import Foundation

class CustomersVM: NSObject {

// MARK: - Properties
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var personeType : PersonType?
     var vehicles: [VehicleM]?
    var vehicleAaa: [Vehicle]?
    var vehicletype: VehicleT?
        var company: String?
         var manufacture: String?
    var fullName: String {
        get {
              return (firstName ?? "") + " " + (lastName ?? "")
           }
    }
    
    // MARK: - Life Cycle
    init(person: PersonM){
        self.id = person.id
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.email = person.emailID
        self.vehicles = person.vehicle
        self.personeType = person.type
    }
    init(vehicle : VehicleM) {
        self.vehicletype = vehicle.vehicleType!
            self.company = vehicle.vehicleDescription!
            self.manufacture = vehicle.manufacturerName!
    }
}
public class VehicleAdd : NSObject
{
    var id: Int?
       var vehicletype: VehicleT
       var company: String?
       var manufacture: String?
     
    init(vehicle :Vehicle) {
        self.vehicletype = vehicle.vehicleType!
        self.company = vehicle.vehicleDescription
        self.manufacture = vehicle.manufacturerName
       
    }
}
