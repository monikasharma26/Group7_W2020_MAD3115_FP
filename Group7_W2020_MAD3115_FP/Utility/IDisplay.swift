//
//  IDisplay.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation

@objc protocol IDisplay {
/// method to Display details
func display()

/// method to update calculate TotalBill
 @objc optional func calculateTotal() -> Float

}
