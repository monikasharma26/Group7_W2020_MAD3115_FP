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
class Person {
    
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

init(id: String, firstName: String, lastName: String, gender: String, birthDate: Int, mobileNumber: String, emailId: String, userName: String, password: String) throws
{
   self.id = id
   self.firstName = firstName
   self.lastName = lastName
   self.gender = gender
   self.birthDate = birthDate

 guard( mobileNumber.isvalidPhoneNumber() ) else {
            throw CustomerError.mobileInvalid
        }
        self.mobileNumber = mobileNumber
        if emailId.isValidEmail() {
                          self.emailId = emailId
                      }
                       else
                        { throw CustomerError.emailInvalid   }
        
        self.userName = userName
        self.password = password
        
    }
            
}

extension Person
{

@objc func calculateTotal() -> Float {
    return 0.0
}

func initiateVehileClass(vechileM: VehicleM?) {
    
var car: Car?

 var motorCycle: MotorCycle?
var bus : Bus?

guard let vechicle = vechileM else {
       //FinalOutput.shared.addNew(text: "Customer has no vehicle.\n")
       return
   }
    









//Variable added for initiate vehicle class function in person extension
