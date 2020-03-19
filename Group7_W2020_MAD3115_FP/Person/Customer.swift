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
    
     init(id: String, firstName: String, lastName: String, gender: String, birthDate: Int, mobileNumber: String, emailId: String, userName: String, password: String, address : String?, city: String?, vehicle : VehicleM?) throws {
        
        guard (emailId.isValidEmail()) else {
                  throw CustomerError.emailInvalid
              }
              
              guard( mobileNumber.isvalidPhoneNumber() ) else {
                      throw CustomerError.mobileInvalid
                  }
             try super.init (id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, mobileNumber: mobileNumber, emailId: emailId, userName: userName, password: password)
              
              self.address = address
              self.city = city
              self.vehicle = vehicle
                 
             }
}
