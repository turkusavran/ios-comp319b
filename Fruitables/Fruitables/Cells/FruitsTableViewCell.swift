//
//  FruitsTableViewCell.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
