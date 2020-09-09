//
//  DropDownCell.swift
//  PopUpTask
//
//  Created by Swaminath on 5/19/18.
//  Copyright © 2018 msr. All rights reserved.
//

import UIKit

class DropDownCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
