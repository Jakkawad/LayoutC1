//
//  CustomTableViewCell.swift
//  LayoutC1
//
//  Created by admin on 2/24/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var mTitleLabel:UILabel!
    @IBOutlet weak var mSubtitleLabel:UILabel!
    @IBOutlet weak var mThumbnailImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
