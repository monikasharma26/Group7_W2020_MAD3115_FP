//
//  Date+Extension.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
extension Date
{
    public func getForamttedDate() -> String
    {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-YYYY"
        let formattedDate = dateFormatterPrint.string(from: self)
        return formattedDate
    }
    public static func from(year: Int, month: Int, day: Int) -> Date? {
           let calendar = Calendar(identifier: .gregorian)
           var dateComponents = DateComponents()
           dateComponents.year = year
           dateComponents.month = month
           dateComponents.day = day
           return calendar.date(from: dateComponents) ?? nil
       }
    public static func dateDifference(birthYear: Int) -> Int {
    //Getting Date
    let date = Date()
    //getting year
    let calender = Calendar.current
    let currYear = calender.component(.year, from: date)
    //returning result
    return currYear - birthYear
        
      }
    public static func formattedDate(sDate : String) -> Date?
       {
           let dateFormatterPrint = DateFormatter()
           dateFormatterPrint.dateFormat = "dd-MM-YYYY"
           let formattedDate : Date? = dateFormatterPrint.date(from: sDate)
           return formattedDate
       }
}
