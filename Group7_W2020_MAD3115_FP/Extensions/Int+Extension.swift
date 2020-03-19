//
//  Int+Extension.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
extension Int {
    public func carBaseRate() -> Int
               {
               return 100
               }
    public func motorCycleBaseRate() -> Int
    {
        return 50
    }
    public func busBaseRate() -> String
               {
                   return "\(self)250"
               }
    public func carRatePerKm() -> String
               {
                   return "\(self)100"
               }
    public func motorCycleRatePerKm() -> Int
    {
        return 50
    }
}
