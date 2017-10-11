//
//  SettingsViewController.swift
//  bankingApp
//
//  Created by Arjun Lalwani on 10/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func agentLocation(_ sender: Any) {
        let alertController = UIAlertController(title: "Agent Location", message: "Google Maps with Agent Location", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismsiss", style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func reportFraud(_ sender: Any) {
        let alertController = UIAlertController(title: "Report Fraud", message: "Agent Number - (404)-456-4123. Call or send a message", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func signOutButton(_ sender: Any) {
        let mainView = self.storyboard?.instantiateViewController(withIdentifier:"MainVC") as! ViewController
        
        self.present(mainView, animated: true, completion: nil)
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
