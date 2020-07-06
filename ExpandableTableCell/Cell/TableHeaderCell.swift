//
//  TableHeaderCell.swift
//  ExpandableTableCell
//
//  Created by Jenish Mistry on 14/05/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: TableHeaderCell, section: Int)
}

class TableHeaderCell: UITableViewCell {

    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0

    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var labelArrow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TableHeaderCell.tapHeader(_:))))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? TableHeaderCell else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        labelArrow.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
}
