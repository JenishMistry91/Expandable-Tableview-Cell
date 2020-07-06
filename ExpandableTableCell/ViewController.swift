//
//  ViewController.swift
//  ExpandableTableCell
//
//  Created by Jenish Mistry on 14/05/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = sectionsData
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.register(UINib.init(nibName: TableCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TableCell.reuseIdentifier)
        tblView.register(UINib.init(nibName: TableHeaderCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TableHeaderCell.reuseIdentifier)
        tblView.rowHeight = UITableView.automaticDimension
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel[section].collapsed ? 0 : viewModel[section].items.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.reuseIdentifier, for: indexPath) as! TableCell
        let item: Item = viewModel[indexPath.section].items[indexPath.row]
        cell.lblName.text = item.name
        cell.lblDesc.text = item.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: TableHeaderCell.reuseIdentifier) as! TableHeaderCell
        header.backgroundColor = UIColor.lightGray
        header.headerName.text = viewModel[section].name
        header.labelArrow.text = ">"
        header.setCollapsed(viewModel[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
}

extension ViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: TableHeaderCell, section: Int) {
        let collapsed = !viewModel[section].collapsed
        
        // Toggle collapse
        viewModel[section].collapsed = collapsed
        header.setCollapsed(collapsed)

        self.tblView.reloadData()
        //tblView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .none)
    }
    
}
