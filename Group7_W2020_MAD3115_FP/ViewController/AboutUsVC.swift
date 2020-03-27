//
//  AboutUsVC.swift
//  Group7_W2020_MAD3115_FP
//
//  Created by S@i on 2020-03-26.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit
import WebKit

class AboutUsVC: UIViewController,WKNavigationDelegate {


    @IBOutlet weak var aboutusWeb: WKWebView!
    override func viewDidLoad() {
            super.viewDidLoad()
            loadHTMLFile()
          
            
        }
        
        func loadHTMLFile(){
            let filepath = Bundle.main.url(forResource: "Aboutus", withExtension: "html")
            let aboutUsLink = URLRequest(url: filepath!)
            aboutusWeb.load(aboutUsLink)
        }
   
   
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
