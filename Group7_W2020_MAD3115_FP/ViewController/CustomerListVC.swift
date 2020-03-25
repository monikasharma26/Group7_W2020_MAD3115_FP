//
//  CustomerListVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-22.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
class CustomerListVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var option : OptionSelected?
    // MARK:- Properties
    @IBOutlet weak var lblCust: UILabel!
    @IBOutlet var top_view: UIView!
    @IBOutlet var custmList_tv: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnadd: UIButton!
    
    @IBOutlet weak var btndelete: UIButton!
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
       
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(CustomerListVC.refresh), name:  Notification.Name("customerListRefresh"), object: nil)
        loadScreen()
        
    }
    func loadScreen()
    {
        switch option {
        case .Customers:
        btnadd.isHidden = false
        btndelete.isHidden = false
        lblCust.text = "Cutosmer List"
        case .Owner:
            lblCust.text = "Owners List"
            btndelete.isHidden = true
            btnadd.isHidden = true
            case .Driver:
            lblCust.text = "Drivers List"
            btndelete.isHidden = true
            btnadd.isHidden = true
            
        default:
            print("test")
            
        }
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
        switch option {
        case .Customers:
            Singelton.intance.populateCustomer(optionselect: OptionSelected.Customers)
        case .Owner:
            Singelton.intance.populateCustomer(optionselect: OptionSelected.Owner)
        case .Driver:
            Singelton.intance.populateCustomer(optionselect: OptionSelected.Driver)
        default:
            print("")
        }
       
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return Singelton.intance.customerArr.count
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
     let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerListTVC", for: indexPath ) as! CustomerListTVC
        
         //
         let customerData = Singelton.intance.customerArr[indexPath.row]
         //
         cell.setDisplay(customer: customerData)
         return cell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
         let storyboard = UIStoryboard(name: "Home", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailVC
        switch option {
        case .Customers:
            vc.option = OptionSelected.Customers
        case .Owner:
            vc.option = OptionSelected.Owner
        case .Driver:
            custmList_tv.allowsSelection = true
            break
        default:
            print("")
        }
        if( option != OptionSelected.Driver )
        {
         vc.custDetailArrInd = indexPath.row
         self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {print("")}
         
     }
    
}


