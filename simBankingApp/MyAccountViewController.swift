//
//  MyAccountViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/10/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .default
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller.
        // Required else navigation bar is displayed by tableVC due to embbed NavVC
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HistorySegue" {
            let controller = segue.destination as! HistViewController
            controller.historyDictionary = historyDictionary
        }
    
    }*/
}
