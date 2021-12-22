//
//  PharmaciesTableViewCell.swift
//  Pharmeasy
//
//  Created by Türkü on 19.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

class PharmaciesTableViewCell: UITableViewCell {
    @IBOutlet weak var pharmacyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
