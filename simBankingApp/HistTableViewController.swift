//
//  HistTableViewController.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/11/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HistTableViewController: UITableViewController {

    // Initializing an array of dictionary to store history of transactions
    var historyDictionary = [Dictionary<String, String>]()
    
    // Addeding a boolean to know when the array is filled
    var loadedHistory = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // makes status bar black (default)
        UIApplication.shared.statusBarStyle = .default
        
        // calls the function that fills the dictionary to display table view
        displayLastTransactions()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Informs TableVC on number of rows to fill with information
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.historyDictionary.count
    }
    
    // Populates each cell with data from the dictionary of transactions
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistCell") as! HistTableViewCell
        
        // Disabling the touch interaction that highlights the cell in dark in the Table View
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        // Displaying History on TableVC once the data is stored in the historyDictionary from the API request
        if self.loadedHistory {
            cell.amountLabel.text = "$" + historyDictionary[indexPath.row]["amount"]!
            cell.historyLabel.text = historyDictionary[indexPath.row]["type"]
        }
        return cell
    }

    // Populates and creates new dictionary to store relevant information for displaying history
    func displayLastTransactions() {
        
        // Making a GET request to the API and receiving data in JSON format
        Alamofire.request("\(Constants.URL.Link)transactions/\(Constants.Account.User)").responseJSON { response in
            
            if let json = response.result.value {
                
                let parsed_json:JSON = JSON(json)
                for (_, value) in parsed_json {
                    var histInfo: [String: String] = ["amount": "", "type": ""]
                    
                    // Ensuring validity of source to destination account
                    if let from_acct = value["from_account_name"].string {
                        if let to_acct = value["to_account_name"].string {
                            
                            // Determining if money was transferred or received and storing in dictionary
                            if from_acct == Constants.Account.User {
                                histInfo["type"] = "Transferred Money to \(to_acct)"
                            } else {
                                histInfo["type"] = "Received Money from \(from_acct)"
                            }
                        }
                    }
                    
                    // Adding amount transferred or received to dictionary
                    if let amount = value["amount"].int {
                        histInfo["amount"] = String(amount)
                    }
                    
                    // Appending array with one new history transaction
                    self.historyDictionary.append(histInfo)
                }
            
                // Setting to true once all transactions recorded in array
                self.loadedHistory = true
                
                // Reloading data once dictionary is populated, this calls the tableView (cellForRowAt) and then reloads the TableVC (this file)
                self.tableView.reloadData()
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
}
