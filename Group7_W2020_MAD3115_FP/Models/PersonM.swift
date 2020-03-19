//
//  PersonM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

struct PersonM : Codable {
    // properties
   let id, firstName, lastName: String
      let gender, mobileNumber, emailID: String
      let userName, password, address, city: String
      let type: PersonType?
      let  birthDate : Int
      let vehicle: VehicleM?
}

enum PersonType: String, Codable {
    case Customer = "Customer" ,Owner = "Owner", Driver = "Driver"
}

