//
//  TransferAcctViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class TransferAcctViewController: UIViewController {

    @IBOutlet weak var accountNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making status bar black (default)
        UIApplication.shared.statusBarStyle = .default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func SubmitButton(_ sender: UIButton) {

        // Making a request to the API, recieving a JSON in return
        Alamofire.request("\(Constants.URL.Link)accounts").responseJSON { response in
            
            if let json = response.result.value {
                
                // Converting json into a JSON object to use by the SwiftyJSON library
                let parsed_json = JSON(json)
                for (_, value) in parsed_json {
                    
                    // If account numbered entered matches the account in the databse, segue to the nextVC
                    if self.accountNum.text == value["account_id"].string! {
                        self.performSegue(withIdentifier: "AmountSegue", sender: nil)
                    }
                }
            }
            
            // display alert if the account entered is not found
            let alert = UIAlertController(title: "Invalid Account", message: "Account Number is invalid", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

    // Disabling keyboard if touched anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AmountSegue" {
            let controller = segue.destination as! TransferAmtViewController
            controller.transferToAcct = accountNum.text!
        }
    }
}
