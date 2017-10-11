//
//  CurrentBalanceViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/8/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CurrentBalanceViewController: UIViewController {
    
    
    @IBOutlet weak var BalanceLabel: UILabel!
    var inputPIN = ""
    let url: String = Constants.URL.Link
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .default
        getBalance()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getBalance() {
        
        // Parameters to be passed in for a POST Request
        let parameters: Parameters = [
            "acct_id" : Constants.Account.User,
            "pin_num" : inputPIN
        ]
        
        // Making request to API, and receiving a JSON in returen
        Alamofire.request(url + "check_balance/", method: .post, parameters: parameters).responseJSON{ response in
            
            //Check if the recieved result has a value
            if let json = response.result.value {
                var parsed_json:JSON = JSON(json)
                if let balance = parsed_json[0]["balance"].float {
                    self.BalanceLabel.text = "Current Balance is $\(balance)"
                }
            }
        }
        
        // Making a second request to API again for case when PIN is invalid, in which case JSON is not returned
        Alamofire.request(url + "check_balance/", method: .post, parameters: parameters).responseString{ response in
            
            // Check if error is valid
            if let error = response.result.value {
                if (error.range(of: "Error") != nil) {
                    let alert = UIAlertController(title: "Invalid PIN", message: "Entered PIN is invalid", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
