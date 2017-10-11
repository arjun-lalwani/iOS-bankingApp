//
//  PopUpViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PopUpViewController: UIViewController {

    @IBOutlet weak var TransferAmount: UILabel!
    @IBOutlet weak var TotalAmt: UILabel!
    
    // all transfer details being passed over by previousVCs
    var to_acct: String = ""
    var pin_num: String = ""
    var transferAmt: String = ""
    var invalidPIN: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making status bar black (default)
        UIApplication.shared.statusBarStyle = .default
        
        // Displaying information on pop up window. Assuming FEE = $0, so totalAmt = transferAmt
        TransferAmount.text = "$" + transferAmt
        TotalAmt.text = "$" + transferAmt
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Determines if transfer is successful or not
    @IBAction func ConfirmTransferButton(_ sender: Any) {
        
        // Casting transfer amt to Float as required by API.
        let amtToTransfer = Float(transferAmt)
        
        // Parameters to be passsed to make a POST request
        let parameters: Parameters = [
            "from_acct" : Constants.Account.User,
            "pin_num" : pin_num,
            "to_acct" : to_acct,
            "trans_amt": amtToTransfer!
        ]
        
        // Making a POST request to the API and receiving data in the form of a string
        Alamofire.request("\(Constants.URL.Link)transfer/", method: .post, parameters: parameters).responseString { response in
            
            if let value = response.result.value {
                
                // Performing appropriate action depending on the message receieved
                // Determining Success or Error based on if string contains substring
                if (value.range(of: "Success") != nil) {
                    self.performSegue(withIdentifier: "HomePageSegue", sender: nil)
                    
                // Displaying alert if balance is insufficient
                } else if ((value.range(of: "Insufficient")) != nil) {
                    let alert = UIAlertController(title: "Invalid Balance", message: "Insufficient balance to make transaction", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                // Displaying alert if PIN is invalid
                } else {
                    let alert = UIAlertController(title: "Invalid PIN", message: "Entered PIN is failed", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }

    @IBAction func CancelTranferButton(_ sender: Any) {
        performSegue(withIdentifier: "PinPageSegue", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomePageSegue" {
            _ = segue.destination as! UWPesaViewController
        } else if segue.identifier == "PinPageSegue" {
            _ = segue.destination as! TransferPINViewController
        }
    }
}
