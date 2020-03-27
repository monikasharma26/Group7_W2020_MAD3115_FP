//
//  SignUpVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    let user = UserDefaults.standard
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmailID: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtREPSw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton()
        txtPass.isSecureTextEntry = true
        txtREPSw.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    private func backButton()
         {
            let btnBack=UIBarButtonItem(title: "SignUp", style: .done, target: self, action: #selector(SignUpVC.back(sender:)))
             navigationItem.leftBarButtonItem=btnBack
         }
         
         @objc func back(sender: UIBarButtonItem)
         {
             navigationController?.popViewController(animated: true)
         }

    @IBAction func btnCancel(_ sender: UIButton) {
    }
    @IBAction func btnsave(_ sender: UIButton) {
        if(txtFullName.text!.count)>=3
        {
            if(txtEmailID.text?.isValidEmail())!
            {
                if(txtPass.text?.isValidPassword())!
                {
                    if((txtREPSw.text?.isValidPassword())!)
                    {
                        if(txtPass.text == txtREPSw.text)
                        {
                            user.set(txtFullName.text, forKey: "FullName")
                            user.set(txtEmailID.text, forKey: "EmailId")
                            user.set(txtPass.text, forKey: "Password")
                           let sb = UIStoryboard(name: "Welcome", bundle: nil)
                           let welcomeVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! LoginVC
                           self.navigationController?.pushViewController(welcomeVC, animated: true)
                        }
                        else
                        {
                            let signUpValidate = UIAlertController(title: "Password ALERT", message: "Password is not matched.", preferredStyle: .alert)
                                signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                                self.present(signUpValidate, animated: true)
                         }
                        
                    }
                    else
                    {
                    let signUpValidate = UIAlertController(title: "PASSWORD ALERT", message: "Password should contain one uppercase, one digit, one lowercase and length 8.",preferredStyle: .alert)
                        signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                        self.present(signUpValidate, animated: true)
                    }
                }
                else
                {
                    let signUpValidate = UIAlertController(title: "Congrats!!", message: "Account Created.", preferredStyle: .alert)
                    signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                    self.present(signUpValidate, animated: true)
                }
                
            }
            else
            {
                let signUpValidate = UIAlertController(title: "USERNAME ALERT", message: "Username needs to be of length 3.", preferredStyle: .alert)
                           signUpValidate.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
                           self.present(signUpValidate, animated: true)
            }
        }
    }

}
