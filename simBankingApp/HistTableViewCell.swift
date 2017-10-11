//
//  HistTableViewCell.swift
//  simBankingApp
//
//  Created by Arjun Lalwani on 4/11/17.
//  Copyright © 2017 Arjun Lalwani. All rights reserved.
//

import UIKit

class HistTableViewCell: UITableViewCell {

    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
