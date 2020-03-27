//
//  HomeViewController.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-20.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var view_deletecoustmer: UIView!
    @IBOutlet var view_coustmers: UIView!
    @IBOutlet var view_addbills: UIView!
    @IBOutlet var view_add_vehicle: UIView!
    @IBOutlet var view_aboutus: UIView!
    @IBOutlet var view_contactus: UIView!
   
    var array: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
         let viewgesture = UITapGestureRecognizer()
        viewgesture.numberOfTapsRequired = 1
        viewgesture.addTarget(self, action: #selector(viewbill))

        
        let deletegesture = UITapGestureRecognizer()
        deletegesture.numberOfTapsRequired = 1
        deletegesture.addTarget(self, action: #selector(deletecoustmer))
        
        let addgesture = UITapGestureRecognizer()
              addgesture.numberOfTapsRequired = 1
              addgesture.addTarget(self, action: #selector(addbill))
        
        let addveh = UITapGestureRecognizer()
                    addveh.numberOfTapsRequired = 1
                    addveh.addTarget(self, action: #selector(addvehicle))
        
        let contactgesture = UITapGestureRecognizer()
                    contactgesture.numberOfTapsRequired = 1
                    contactgesture.addTarget(self, action: #selector(contactbrowser))
        
        let aboutgesture = UITapGestureRecognizer()
                    aboutgesture.numberOfTapsRequired = 1
                    aboutgesture.addTarget(self, action: #selector(aboutbrowser))

            
         view_deletecoustmer.addGestureRecognizer(deletegesture)
         view_coustmers.addGestureRecognizer(viewgesture)
         view_addbills.addGestureRecognizer(addgesture)
         view_add_vehicle.addGestureRecognizer(addveh)
         view_aboutus.addGestureRecognizer(contactgesture)
         view_contactus.addGestureRecognizer(aboutgesture)

    
    }
    
    @objc func addvehicle() {
     let obj = self.storyboard?.instantiateViewController(withIdentifier: "CustomerListVC") as! CustomerListVC
        obj.option = OptionSelected.Driver
            self.navigationController?.pushViewController(obj, animated: true)
       }
    
    @objc func contactbrowser() {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsVC") as! AboutUsVC
                      self.navigationController?.pushViewController(obj, animated: true)
       }
    
    @objc func aboutbrowser() {
     let obj = self.storyboard?.instantiateViewController(withIdentifier: "ContacttusVC") as! ContacttusVC
       self.navigationController?.pushViewController(obj, animated: true)
       }

    
    @objc func deletecoustmer() {
      let obj = self.storyboard?.instantiateViewController(withIdentifier: "CustomerListVC") as! CustomerListVC
        obj.option = OptionSelected.Customers
               self.navigationController?.pushViewController(obj, animated: true)
    }
    
    @objc func addbill() {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "CustomerListVC") as! CustomerListVC
        obj.option = OptionSelected.Owner
               self.navigationController?.pushViewController(obj, animated: true)
    }
    
    
    @objc func viewbill() {
       let obj = self.storyboard?.instantiateViewController(withIdentifier: "CustomerListVC") as! CustomerListVC
           obj.option = OptionSelected.Owner
        obj.selextedtxt = "Vehicles"
                  self.navigationController?.pushViewController(obj, animated: true)
    }
    
    @IBAction func but_backhome(_ sender: Any) {
      let alertController = UIAlertController(title: "Signout!!", message: "Do You want to Sign Out?", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) {
          UIAlertAction in
          self.navigationController?.popToRootViewController(animated: true)
          
      }
      let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
          UIAlertAction in
      }
          
      alertController.addAction(okAction)
      alertController.addAction(cancelAction)
      
      // Present the controller
      self.present(alertController, animated: true, completion: nil)
    }
}
