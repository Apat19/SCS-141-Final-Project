//
//  ReviewViewController.swift
//  SCS 141 Final Project
//
//  Created by Austin Patton on 4/29/23.
//


import Foundation
import UIKit
import MessageUI
class ReviewViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    @IBOutlet weak var reviewSent: UILabel!
    
    @IBAction func sendReview(_ sender: Any) {
        
        reviewSent.text = "Review Sent!"
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        //configure the fields of the interface
        composeVC.recipients = ["7243960224"]
        composeVC.body = "Review has been sent!"
        
        
        
        //present the view controller modally
        if MFMessageComposeViewController.canSendText(){
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func viewDidLoad() {
       
    }


}

