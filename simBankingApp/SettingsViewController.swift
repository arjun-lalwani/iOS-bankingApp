//
//  SettingsViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SettingsViewController: UIViewController {

    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .default
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ChangeLinkButton(_ sender: Any) {
        
        // Changing Link to what user requests
        // Default is configured to "uw-pesa-ictd"
        if linkTextField.text != "" {
            Constants.URL.Link = "http://" + linkTextField.text! + "/API"
        } else {
            let alert = UIAlertController(title: "Enter Link", message: "Enter a valid link to change", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated:true, completion: nil)
        }
    }

    @IBAction func ChangeSubmitButton(_ sender: Any) {
        if userTextField.text != "" {
            
            // Making a request to the API, recieving a JSON in return
            Alamofire.request("\(Constants.URL.Link)accounts").responseJSON { response in
                
                if let json = response.result.value {
                    
                    // Converting json into a JSON object to use by the SwiftyJSON library
                    let parsed_json = JSON(json)
                    for (_, value) in parsed_json {
                        
                        // If account numbered entered matches the account in the database, change the current user,
                        // modify PIN accordingly, display success alert
                        if self.userTextField.text == value["account_id"].string! {
                            Constants.Account.User = self.userTextField.text!
                            _ = self.userTextField.text!
            
                            // Displaying alert and exiting block
                            self.showSuccessAlert()
                            return
                        }
                    }
                }
                
                // Displaying alert if the account entered is not found
                let alert = UIAlertController(title: "Invalid Account", message: "Account Number is invalid", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }

        } else {
            let alert = UIAlertController(title: "Enter User Name", message: "Enter a valid user name to change", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated:true, completion: nil)
        }
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "User Name Changed", message: "Your user name is successfully change to \(Constants.Account.User)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated:true, completion: nil)
        userTextField.text = ""
    }
    
    // Disables keyboard if user touches anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
