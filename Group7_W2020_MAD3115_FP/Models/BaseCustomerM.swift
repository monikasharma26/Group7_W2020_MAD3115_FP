//
//  BaseCustomerM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
struct BaseCustomer: Codable {
    
     var per : [PersonM]?
        enum CodingKeys: String, CodingKey {
        case per = "PersonM"
    }
    
   
}
