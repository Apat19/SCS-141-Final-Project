//
//  ViewController.swift
//  SCS 141 Final Project
//
//  Created by Austin Patton on 4/29/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var orderPlaced: UILabel!
    
    @IBAction func placeOrder(_ sender: Any) {
        orderPlaced.text = "Order Placed"
    }
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

