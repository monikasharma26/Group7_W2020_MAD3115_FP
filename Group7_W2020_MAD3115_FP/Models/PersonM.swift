//
//  PersonM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
struct PersonM : Codable {
   
   // MARK: - Properties
        var id: Int?
        var firstName: String?
        var lastName: String?
        var emailID, gender, mobileNumber, userName, password, address, city: String?
        var birthDate: Int?
        var type:  PersonType?
      //addedc for each cutomer bills
       var vehicle: [VehicleM]? = []
}
enum PersonType: String, Codable {
    case Customer = "Customer" ,Owner = "Owner", Driver = "Driver"
}

