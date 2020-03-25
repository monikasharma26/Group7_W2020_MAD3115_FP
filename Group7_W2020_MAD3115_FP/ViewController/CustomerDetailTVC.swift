//
//  CustomerDetailTVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-23.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class CustomerDetailTVC: UITableViewCell {

    // MARK: - Properties
        @IBOutlet var containView: UIView!
        @IBOutlet var innerView: UIView!

        @IBOutlet var type_img: UIImageView!
        @IBOutlet var day_lbl: UILabel!
        @IBOutlet var bill_lbl: UILabel!
        @IBOutlet var type_lbl: UILabel!
        @IBOutlet var upDown_img: UIImageView!
        
        @IBOutlet var desc_view: UIView!
        @IBOutlet var descp_lbl: UILabel!
        
        // MARK: -  Life Cycle
        override func awakeFromNib() {
            super.awakeFromNib()
            //
            desc_view.addShadow(view: desc_view, color: UIColor.hexStringToUIColor(hex: "6D67FD").cgColor, offset: CGSize(width: 0, height: 3), opacity: 0.7, radius: 4)
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        // MARK: - Helper
        func setDisplay(vehicle: VehicleM) {
            
            //  case car = "Car", motorcycle = "Motorcycle" , bus = "Bus"
            let type = vehicle.vehicleType
            if type == VehicleT.car{
                type_img.image = UIImage(named: "car-3")
                descp_lbl.text = "ManuFacture Name: \(vehicle.manufacturerName ) \nID Num: \(vehicle.vehicleIdentificationNumber ) \nCar Color: \(vehicle.carColor ) \nvehicleDescription: \(vehicle.vehicleDescription )  \nFuel Type: \(vehicle.fuelType ) \nNumber of Seats: \(vehicle.noOfSeat)"
                day_lbl.text = "Car"
                type_lbl.text =   "\(vehicle.carType)"
                if vehicle.ptype == OptionSelected.Customers {
                    bill_lbl.text = "$1343.00"
                }
                else
                {
                     bill_lbl.text = vehicle.manufacturerName
                }
               
            }
            else if type == VehicleT.bus {
                type_img.image = UIImage(named: "bus")
                descp_lbl.text = "ManuFacture Name: \(vehicle.manufacturerName ) \nID Num: \(vehicle.vehicleIdentificationNumber ) \nBus Color: \(vehicle.carColor ) \nvehicleDescription: \(vehicle.vehicleDescription )  \nFuel Type: \(vehicle.fuelType ) \nNumber of Seats: \(vehicle.noOfSeat)"
                day_lbl.text = "Bus"
                type_lbl.text =   "\(vehicle.carType)"
               if vehicle.ptype == OptionSelected.Customers {
                                   bill_lbl.text = "$1343.00"
                               }
                               else
                               {
                                    bill_lbl.text = vehicle.manufacturerName
                               }
            }
            else
            {
                type_img.image = UIImage(named: "motocycle")
                descp_lbl.text = "ManuFacture Name: \(vehicle.manufacturerName ) \nID Num: \(vehicle.vehicleIdentificationNumber ) \nMotorCycle Color: \(vehicle.carColor ) \nvehicleDescription: \(vehicle.vehicleDescription )  \nFuel Type: \(vehicle.fuelType ) \nNumber of Seats: \(vehicle.noOfSeat)"
                 day_lbl.text = "MotorCycle"
                 type_lbl.text =   "\(vehicle.carType)"
                if vehicle.ptype == OptionSelected.Customers {
                                    bill_lbl.text = "$1343.00"
                                }
                                else
                                {
                                    bill_lbl.text = vehicle.manufacturerName
                                }
            }
    
        }

}
