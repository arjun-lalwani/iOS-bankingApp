//
//  BalancePINViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class BalancePINViewController: UIViewController {

    @IBOutlet weak var PinTextField: UITextField!
    var pinEntered = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SubmitButtton(_ sender: UIButton) {
        
        // Display alert if pin entered is not 4 digits, else perform segue to nextVC
        if PinTextField.text?.characters.count == 4 {
            pinEntered = PinTextField.text!
            performSegue(withIdentifier: "balanceSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Invalid PIN", message: "PIN should be 4 digits long", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    // Disables keyboard if user touches anywhere on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "balanceSegue" {
            let controller = segue.destination as! CurrentBalanceViewController
                controller.inputPIN = pinEntered
        }
    }
}
