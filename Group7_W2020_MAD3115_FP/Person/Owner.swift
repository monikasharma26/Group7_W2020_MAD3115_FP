//
//  Owner.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Owner
{
    
    var companyTitle : String = "LTE"

    var webSite : String  = "www.lte.com"

      var vehicle : VehicleM?
    
    init(id: String, firstName: String, lastName: String, gender: String, birthDate: Int, mobileNumber: String, emailId: String, userName: String, password: String, address : String, city : String, vehicle : VehicleM?) throws {
        
       guard (emailId.isValidEmail()) else {
           throw CustomerError.emailInvalid
       }
       guard( mobileNumber.isvalidPhoneNumber()) else {
               throw CustomerError.mobileInvalid
           }
         try super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, mobileNumber: mobileNumber, emailId: emailId, userName: userName, password: password)
        
        self.vehicle = vehicle
        
    }
}
