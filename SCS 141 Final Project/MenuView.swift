//
//  MenuView.swift
//  SCS 141 Final Project
//
//  Created by Austin Patton on 4/29/23.
//

import Foundation
import WebKit


class MenuView: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var nextButtonText: UILabel!
    
   
    @IBAction func tapNextButton(_ sender: Any) {
        nextButtonText.text = "Go to the next tab to order!"
    }
    
    override func viewDidLoad() {
        let myURL = URL(string: "https://www.dominos.com/en/pages/order/menu#!/menu/category/viewall/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
       
    }


}

