//
//  VehicleListTVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-25.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class VehicleListTVC: UITableViewCell {
    
    
    
    @IBOutlet weak var txt_vehicle_type: UILabel!
    
    
    @IBOutlet weak var txtcompanytype: UILabel!
    @IBOutlet weak var txtSeats: UILabel!
    
    @IBOutlet weak var txtCartype: UILabel!
    @IBOutlet weak var txtmanufacture: UILabel!
    
       
    @IBOutlet weak var txtnoSetas: UILabel!
    @IBOutlet var img_list: UIImageView!
       @IBOutlet var txt_comapny: UILabel!
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }

        func setDisplay(vehicle: VehicleM) {
            txt_vehicle_type.text =  vehicle.vehicleType.map { $0.rawValue }
            txtCartype.text = vehicle.carType
            txtcompanytype.text = vehicle.manufacturerName
            //txtnoSetas.text = vehicle.noOfSeat
                   
                       if(vehicle.manufacturerName == "Honda")
                                  {
                                img_list.image = UIImage(named: "honda-xxl")
                                  }
                       else  if (vehicle.manufacturerName == "BMW")
                                  {
                                    img_list.image = UIImage(named: "bmw")
                                  }
                                  else if (vehicle.manufacturerName == "Mercedes")
                                  {
                                      img_list.image = UIImage(named: "Mercedes")
                                  }
    }
   
}
