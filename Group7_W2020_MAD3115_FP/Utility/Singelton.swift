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
    
   
    
}
