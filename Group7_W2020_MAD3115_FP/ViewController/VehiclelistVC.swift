//
//  VehiclelistVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-25.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class VehiclelistVC: UIViewController , UITableViewDataSource, UITableViewDelegate  {
   
    @IBOutlet weak var btnaddlbl: UIButton!
    @IBOutlet weak var vehicletbl: UITableView!
    @IBOutlet var but_back_vlist: UIButton!
        @IBOutlet var but_add_vehicle: UIButton!
    var custmDetail: CustomersVM?
    var custDetailArrInd = Int()
    var billsList: [VehicleM]?
    var vehcildetails : VehicleM?
        var position : Int!

        // MARK: - Life Cycle
        override func viewDidLoad() {
           custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
            super.viewDidLoad()
              initSetup()
            vehicletbl.reloadData()
            //
            NotificationCenter.default.addObserver(self, selector: #selector(VehiclelistVC.refresh), name:  Notification.Name("vehiclelistRefresh"), object: nil)
            
        }
    func initSetup() {
           //
        custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
        billsList = custmDetail?.vehicles
        vehicletbl.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func refresh() {
           //
           custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
           billsList = custmDetail?.vehicles
        print("test\(billsList)")
           vehicletbl.reloadData()
        
       }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return billsList?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "vehiclecell", for: indexPath ) as! VehicleListTVC
            cell.setDisplay(vehicle: (billsList?[indexPath.row])!)
            //refresh()
            print(btnaddlbl.isSelected)
            if(btnaddlbl.isSelected == false)
            {
                cell.txt_vehicle_type.text = "BMW"
                cell.txtCartype.text = "BMW"
                cell.txtnoSetas.text = "5"
                cell.txt_vehicle_type.text = "Car"
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            print(indexPath.row)
            
            let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete this Vehicle??", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { action in
                //run your function here
                self.deletevehicle(data : indexPath.row)
            }))

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            self.present(alert, animated: true)
            
        }

        @IBAction func but_back_clist(_ sender: Any) {
            
          //  let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
          //  self.navigationController?.pushViewController(obj, animated: true)
            self.navigationController?.popViewController(animated: true)
        }
        
        func deletevehicle(data : Int)
        {
            Singelton.intance.customerArr[position].vehicles?.remove(at: data)
        }
    
    @IBAction func btnadd(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "AddVehicleVC")
                  self.present(vc, animated: true, completion: nil)
       
    }
    
    
    }


 
    
