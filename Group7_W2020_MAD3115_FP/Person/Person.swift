//
//  Person.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//
enum Gender : String
{
   case Male
   case Female
   case Other
}

import Foundation
class Person
{
    var id : String
    var firstName: String
    var lastName:  String
    var fullName: String {  get
                    {
                    return "\(firstName) \(lastName)"
                    }
    }
    var gender :  String
    var birthDate : Int?
    var age: Int
       {
           get
           {
               return Date.dateDifference(birthYear: self.birthDate!)
           }
       }
    var mobileNumber : String
    var emailId : String
    var userName : String
    var password : String
    var vehicleDictionary : Dictionary<Int, Vehicle>?
}
