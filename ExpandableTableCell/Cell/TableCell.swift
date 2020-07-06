//
//  TableCell.swift
//  ExpandableTableCell
//
//  Created by Jenish Mistry on 14/05/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
