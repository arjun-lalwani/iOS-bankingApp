//
//  BalanceViewController.swift
//  bankingApp
//
//  Created by Arjun Lalwani on 22/11/16.
//  Copyright © 2016 Arjun Lalwani. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        }
    }*/

}
