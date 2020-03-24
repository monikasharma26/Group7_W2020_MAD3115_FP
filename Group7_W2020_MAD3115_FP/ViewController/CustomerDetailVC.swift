//
//  CustomerDetailVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-23.
//  Copyright © 2020 S@i. All rights reserved.
//

import Foundation
import UIKit

class CustomerDetailVC : UIViewController {

    // MARK: - Properties
    var seleInd = -1
    
    @IBOutlet weak var ttllbl: UILabel!
    var custmDetail: CustomersVM?
    var custDetailArrInd = Int()
    var billsList: [VehicleM]?
    var vehcildetails : VehicleM?
    @IBOutlet var customerN_lbl: UILabel!
    @IBOutlet var email_lbl: UILabel!
    @IBOutlet var total_lbl: UILabel!
    @IBOutlet var detail_view: UIView!
    
    @IBOutlet var titleDate_lbl: UILabel!
    @IBOutlet var design_lblL: UILabel!
    @IBOutlet var design_lblR: UILabel!
    
    @IBOutlet var bill_tv: UITableView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        initSetup()
        
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(CustomerDetailVC.refresh), name:  Notification.Name("customerDetailVCRefresh"), object: nil)
        
    }
        
    // MARK: - Action
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   

    
    func initSetup() {
        //
        custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
        // 1.
        let date = Date() // save date, so all components use the same date
        // date
        let dformatter = DateFormatter()
        dformatter.dateFormat = "d MMM"
        let stDate = dformatter.string(from: date)
        
        // day
        let eformatter = DateFormatter()
        eformatter.dateFormat = "EEEE"
        let stDay = eformatter.string(from: date)
        
        titleDate_lbl.text = String(format: "%@, %@", stDay, stDate)
        customerN_lbl.text = custmDetail?.fullName
        email_lbl.text = custmDetail?.email
        
        
        billsList = custmDetail?.vehicles
        bill_tv.reloadData()
        let type = vehcildetails?.vehicleType
        if(billsList?.count != 0)
        {
        totalBills()
        }
        else
        {
            total_lbl.text = "Customer Has No Vehciles"
             ttllbl.isHidden = false
        }
    }
    
    @objc func refresh() {
        //
        custmDetail =  Singelton.intance.customerArr[custDetailArrInd]
        billsList = custmDetail?.vehicles
        bill_tv.reloadData()
        
        //
       totalBills()
    }
    
    func totalBills() {
            total_lbl.text = "$ 1343.00"
        }
       

}

// MARK:- UITableViewDataSource
extension CustomerDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return billsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerDetailTVC", for: indexPath ) as! CustomerDetailTVC

        //
        cell.setDisplay(vehicle: (billsList?[indexPath.row])!)
        
        //
        cell.desc_view.isHidden = true
        cell.upDown_img.image = UIImage(named: "downIcon")
        if(seleInd == indexPath.row){
            cell.desc_view.isHidden = false
            cell.upDown_img.image = UIImage(named: "upIcon")
            
        }
        
        return cell
    }
    
}

// MARK:- UITableViewDelegate
extension CustomerDetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if(seleInd == indexPath.row){
            return UITableView.automaticDimension//tableView.automatic
        }
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        tableView.deselectRow(at: indexPath, animated: true)
                
        let prevSlInd = seleInd
        seleInd = indexPath.row
        let indexPath = IndexPath(item: seleInd, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
        
        if(prevSlInd >= 0){
            let indexPath = IndexPath(item: prevSlInd, section: 0)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
   
}



