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
    
    //vimp how to make image resizable according to layout in ui kit
    //https://sarunw.com/posts/how-to-resize-uiimageview-to-fit-container-view-using-auto-layout/
    //vimp to fix the image size using the width and height constraints also decreasing the compression ratio 250 in place of 750 this will fit the image as per your need also set image to aspect fit
    //in swiftui we don't need much and can do .resize
}
