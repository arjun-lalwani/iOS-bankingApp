//
//  ViewController.swift
//  bankingApp
//
//  Created by Arjun Lalwani on 08/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pinTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        // direct to other screen.
        if (pinTextField.text?.characters.count != 4) {
            let alertController = UIAlertController(title: "Error", message: "Please enter your 4 digit PIN number", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            // show on screen with animation -> turned on
            self.present(alertController, animated: true, completion: nil)
        } else {
            let next = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarViewController
            self.present(next, animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotPIN(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Forgot PIN", message: "Call : (111)-222-3333 to reset PIN", preferredStyle: UIAlertControllerStyle.alert)
        
        // this the button the user presses to dismiss the alert message
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     //   buttonLabel.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        // once editing is done, and 4 digits are entered, then
//        // make button enabled. 
//    }
    
    // keypad goes down when touched anywhere on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // when return key is pressed goes, keypad goes back down
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
