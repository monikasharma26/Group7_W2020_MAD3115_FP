//
//  String+Extension.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
extension String{
    public static func formattedDate(sDate : String) -> Date?
       {
           let dateFormatterPrint = DateFormatter()
           dateFormatterPrint.dateFormat = "dd-MM-YYYY"
           let formattedDate : Date? = dateFormatterPrint.date(from: sDate)
           return formattedDate
       }
    func getDocumentsDirectory() -> URL {
              let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
              return paths[0]
          }
  func addToFile() {
        let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
        do {
            try write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error.localizedDescription)
        }
    }
}
