//
//  TransferAmtViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class TransferAmtViewController: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    
    // TransferToAcct details provided by TransferAcctVC
    var transferToAcct: String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
        
        // Displaying alert if textfield is nil, else segue to nextVC
        if amountTextField.text != nil {
            
            // Displaying alert if amt is too big to be transferred at once, else performs segue
            if amountTextField.text!.characters.count > 5 {
                let alert = UIAlertController(title: "Invalid Amount", message: "Amount too big to transfer at once", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                performSegue(withIdentifier: "PINSegue", sender: nil)
            }
            
        } else {
            let alert = UIAlertController(title: "Invalid Amount", message: "Enter valid amount to transfer", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PINSegue" {
            let controller = segue.destination as! TransferPINViewController
            controller.transferAmt = amountTextField.text!
            controller.transferToAcct = transferToAcct
        }
    }
}
