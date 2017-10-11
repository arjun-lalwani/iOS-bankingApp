//
//  TransferPINViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TransferPINViewController: UIViewController {

    @IBOutlet weak var pinTextField: UITextField!
    
    // Data passed in by previous VC (TransferAmtVC)
    var transferAmt: String = ""
    var transferToAcct: String = ""
    var invalidPIN: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making status bar black (default)
        UIApplication.shared.statusBarStyle = .default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SubmitButton(_ sender: UIButton) {
        
        // Displaying aert if text field is not filled, else display pop up
        if pinTextField == nil {
            let alert = UIAlertController(title: "Enter PIN", message: "Please enter a PIN to continue", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "PopUpSegue", sender: nil)
        }
    }
    
    // Disables keyboard if user touches anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PopUpSegue" {
            let controller = segue.destination as! PopUpViewController
            controller.transferAmt = transferAmt
            controller.pin_num = pinTextField.text!
            controller.to_acct = transferToAcct
        }
    }
}
