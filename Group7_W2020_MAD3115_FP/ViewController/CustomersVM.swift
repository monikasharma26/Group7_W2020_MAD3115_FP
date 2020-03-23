//
//  CustomersVM.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-22.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import Foundation

class CustomersVM: NSObject {

// MARK: - Properties
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var personeType : PersonType?
     var veicles: [VehicleM]?
    var fullName: String {
        get {
              return (firstName ?? "") + " " + (lastName ?? "")
           }
    }
    
    // MARK: - Life Cycle
    init(person: PersonM){
        self.id = person.id
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.email = person.email
        self.veicles = person.vehicle
        self.personeType = person.type
    }
    
}

// MARK:- UITableViewDataSource
extension CustomerListVC: UITableViewDataSource, UITableViewDelegate {

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
     /*   tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomerDetailVC") as! CustomerDetailVC
        
        vc.custDetailArrInd = indexPath.row
        
        self.navigationController?.pushViewController(vc, animated: true)*/
        
    }
    
}
