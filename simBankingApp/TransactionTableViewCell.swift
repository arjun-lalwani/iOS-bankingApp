//
//  TransactionTableViewCell.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 2/26/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionStatus: UILabel!
    @IBOutlet weak var transactionAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
