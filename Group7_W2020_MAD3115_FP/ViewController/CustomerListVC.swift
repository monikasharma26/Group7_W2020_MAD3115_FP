//
//  CustomerListVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-22.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
class CustomerListVC: UIViewController {

    // MARK:- Properties
    @IBOutlet var top_view: UIView!
    @IBOutlet var custmList_tv: UITableView!
    

    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
       
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(CustomerListVC.refresh), name:  Notification.Name("customerListRefresh"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    @IBAction func addBtnClicked(_ sender: Any) {
    //
           let storyboard = UIStoryboard(name: "Home", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "AddCustomerVC")
           self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Helper
    func initSetup(){
        Singelton.intance.populateCustomer()
        
    }

    @objc func refresh() {
        //
        custmList_tv.reloadData()
    }
   
    @IBAction func backBtnClicked(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnDelete(_ sender: Any) {
         self.showEditing()
    }
    @objc func showEditing()
    {
        if(self.custmList_tv.isEditing == true)
        {
            self.custmList_tv.isEditing = false
         // btnDeleteCustomer.titleLabel?.text="Delete"
        }
        else
        {
            self.custmList_tv.isEditing = true
         //  .titleLabel?.text="Done"

        }
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let count = Singelton.intance.customerArr.count
            let customerData = Singelton.intance.customerArr.remove(at: indexPath.row)
            self.custmList_tv.deleteRows(at: [indexPath], with: .fade)
            
        }
        

    }
    
}


