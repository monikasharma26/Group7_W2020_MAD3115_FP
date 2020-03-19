//
//  DataSource.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

class DataSource {

 private init(){ }

static func readJsonFileWith(name file: String) -> [PersonM] {

let url = Bundle.main.url(forResource: file, withExtension: "json")
guard let jsonData = url else{ return [] }
guard let dataParse = try? Data(contentsOf: jsonData) else { return [] }

  do {
            // check if json data can be converted to foundation object.
            let json = try JSONSerialization.jsonObject(with: dataParse, options: .allowFragments)
            var dataDict = NSDictionary()
            dataDict = json as! NSDictionary
            let jsonSer = try! JSONSerialization.data(withJSONObject: dataDict["PersonData"] as! NSArray)
            
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
