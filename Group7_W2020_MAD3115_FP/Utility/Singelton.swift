//
//  Singelton.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-22.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
class Singelton {
    
    static let intance = Singelton()
    var employeeArr = [Person]()
    var vehicleArr = [VehicleM]()
    var vehiclte = [VehicleAdd]()
    private init(){}
    var customerArr = [CustomersVM]()
    
    func populateCustomer() {
        // fetching data from json...
        let customers = DataSource.readJsonFileWith(name: "Customer")
        Singelton.intance.customerArr.removeAll()
        for custmer in customers {
            Singelton.intance.customerArr.append(CustomersVM(person: custmer))
        }
        
    }
    func populateCustomer(optionselect: OptionSelected) {
           // fetching data from json...
           switch optionselect {
           case .Customers:
               let customers = DataSource.readJsonFileWith(name: "Customer")
               Singelton.intance.customerArr.removeAll()
                     for custmer in customers {
                         Singelton.intance.customerArr.append(CustomersVM(person: custmer))
                     }
           case .Owner:
            let customers = DataSource.readJsonFileWithOwner(name: "Owners")
                          Singelton.intance.customerArr.removeAll()
                                for custmer in customers {
                                    Singelton.intance.customerArr.append(CustomersVM(person: custmer))
               }
               case .Driver:
                          let customers = DataSource.readJsonFileWithOwner(name: "Driver")
                                                 Singelton.intance.customerArr.removeAll()
                                                       for custmer in customers {
                                                           Singelton.intance.customerArr.append(CustomersVM(person: custmer))
            }
                     
           }
            
       }
           
    
   
    
}
