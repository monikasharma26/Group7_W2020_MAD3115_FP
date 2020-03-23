//
//  DataSource.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import Foundation
class DataSource {
    // MARK:- Life Cycle
      //
      
      // MARK:- Functions
      /** parsing method 1
       */
     /* static func readJsonWith(name file: String) -> [PersonM] {
          let url = Bundle.main.url(forResource: file, withExtension: "json")
          guard let jsonData = url else{ return [] }
          guard let data = try? Data(contentsOf: jsonData) else { return [] }
          do {
              let decoder = JSONDecoder()
              let baseModel = try decoder.decode(BaseCustomerM.self, from: data)
            guard let customers = baseModel.per else { return [] }
              return customers
          } catch let err {
              debugPrint(err)
              return []
          }
      }
  */
    
    static func readJsonFileWith(name file: String) -> [PersonM] {
        let url = Bundle.main.url(forResource: file, withExtension: "json")
        guard let jsonData = url else{ return [] }
        guard let dataParse = try? Data(contentsOf: jsonData) else { return [] }
        
        do {
            // check if json data can be converted to foundation object.
            let json = try JSONSerialization.jsonObject(with: dataParse, options: .allowFragments)
            var dataDict = NSDictionary()
            dataDict = json as! NSDictionary
            let jsonSer = try! JSONSerialization.data(withJSONObject: dataDict["Customer"] as! NSArray)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            let employee = try decoder.decode([PersonM].self, from: jsonSer)
           // debugPrint(employee)
            return employee
        } catch let err {
            debugPrint(err)
            return []
        }
    }
    
}
