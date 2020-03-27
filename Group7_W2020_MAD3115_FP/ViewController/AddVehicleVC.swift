//
//  AddVehicleVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-25.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class AddVehicleVC: UIViewController {

    @IBOutlet weak var txtCompany: UITextField!
    @IBOutlet weak var typeVehicle: UITextField!
    @IBOutlet weak var txtSeats: UITextField!
    @IBOutlet weak var vehiclesegment: UISegmentedControl!
    @IBOutlet var testimage: UIImageView!
    var custDetailArrInd = Int()
    var companyArr = [String]()
    var vehicletype : VehicleT?
  //  var vehicObj : VehicleM?
    var vehicleposition : Int = 0
     var userposition : Int = 0
     var purpose : String = ""
    var selection : Int = 0
    
    var pickerView = ToolbarPickerView()
    
   override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
                txtCompany.inputView = pickerView
               txtCompany.inputAccessoryView = pickerView.toolbar
            pickerView.dataSource = self as UIPickerViewDataSource
            pickerView.delegate = self as UIPickerViewDelegate
            pickerView.toolbarDelegate = self as ToolbarPickerViewDelegate
        }
        
        @IBAction func vehcSegment(_ sender: UISegmentedControl) {
            if (vehiclesegment.selectedSegmentIndex == 0){
                vehicletype = VehicleT.car
                   }
                   else if(vehiclesegment.selectedSegmentIndex == 1)
                     {
                        vehicletype = VehicleT.motorcycle
                   }
        }
        
        @IBAction func backBtn(_ sender: UIButton)
        {
            self.dismiss(animated: true, completion: nil)
        }
        
        @IBAction func btncancel(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
        
        @IBAction func btnAdd(_ sender: Any) {
            
            Singelton.intance.customerArr[custDetailArrInd].vehicles?.append(VehicleM(vehicleDescription: "Bmw", manufacturerName: "BMW", noOfSeat: 5,  vehicleType: vehicletype))
            NotificationCenter.default.post(name: Notification.Name("vehiclelistRefresh"), object: nil)
            vehicleAdd()
         
            
        }
    // MARK: - Helper
       func vehicleAdd() {
           //
           let alertController = UIAlertController(title: "Success", message: "Vehicle Created Successfully.", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive) {
               UIAlertAction in
                self.dismiss(animated: true, completion: nil)
           }
           alertController.addAction(okAction)
           
           self.present(alertController, animated: true, completion: nil)
       }
    
    }


    extension AddVehicleVC : UITextFieldDelegate{
                      func textFieldDidBeginEditing(_ textField: UITextField) {
                          if textField == txtCompany{
                              companyArr = ["Honda","BMW","Mercedes"]
                           pickerView.reloadAllComponents()
                              selection = 1
                          }
    }
    }
    extension AddVehicleVC : UIPickerViewDelegate,UIPickerViewDataSource{
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return companyArr.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return companyArr[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                txtCompany.text = companyArr[row]
        }
    }
    extension AddVehicleVC: ToolbarPickerViewDelegate {

                 func didTapDone() {
                     let row = pickerView.selectedRow(inComponent: 0)
                     pickerView.selectRow(row, inComponent: 0, animated: false)
                     
                     if (selection == 1){
                      
                      if(companyArr[row] == "Honda")
                      {
                       self.testimage.image = UIImage(named: "honda-xxl")
                      }
                      else if (companyArr[row] == "Mercedes")
                      {
                          self.testimage.image = UIImage(named: "Mercedes")
                      }
                      else if (companyArr[row] == "BMW")
                      {
                          self.testimage.image = UIImage(named: "bmw")
                      }
                          txtCompany.text = companyArr[row]
                          txtCompany.resignFirstResponder()
                    }
            }

                 func didTapCancel() {
                     if (selection == 1){
                                    txtCompany.text = nil
                                    txtCompany.resignFirstResponder()
                                    }
                 }
              
              func showdialog(data : String )
                        {
                          let alert = UIAlertController(title: "Alert", message: data, preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                          self.present(alert, animated: true)
                        }
              
         }


