//
//  UserCellTableViewCell.swift
//  ecomm_example
//
//  Created by Tejash Singh on 11/04/24.
//

import UIKit

class userCell: UITableViewCell {

    @IBOutlet var viewRef: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
