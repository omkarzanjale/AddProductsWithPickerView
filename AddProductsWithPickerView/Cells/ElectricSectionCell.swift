//
//  ElectricSectionCell.swift
//  Products
//
//  Created by Mac on 24/09/21.
//

import UIKit

class ElectricSectionCell: UITableViewCell {
    @IBOutlet weak var categoryLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
