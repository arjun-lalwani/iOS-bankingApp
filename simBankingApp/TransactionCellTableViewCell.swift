//
//  TransactionCellTableViewCell.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 2/26/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class TransactionCellTableViewCell: UITableViewCell {

    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
