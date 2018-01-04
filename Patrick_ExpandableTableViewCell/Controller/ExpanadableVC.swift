//
//  ExpanadableVC.swift
//  Patrick_ExpandableCell
//
//  Created by pratik panchal on 31/12/17.
//  Copyright © 2017 pratik panchal. All rights reserved.
//

import UIKit

class ExpanadableVC: UIViewController {
    
    //MARK:- Variables & Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [ExpandableModel]()
    
    let des = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillDataSource()
        self.tableView.estimatedRowHeight = 30
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func fillDataSource(){
        for i in 1..<6{
            dataSource.append(ExpandableModel(title: "Cell \(i)", description: des))
            tableView.reloadData()
        }
    }
    
    var expandedIndexPath: IndexPath? {
        didSet {
            switch expandedIndexPath {
            case .some(let index):
                tableView.reloadRows(at: [index], with: .automatic)
            case .none:
                tableView.reloadRows(at: [oldValue!], with: .automatic)
            }
        }
    }
    
}


extension ExpanadableVC : UITableViewDelegate,UITableViewDataSource{
    
    //MARK:- TableView DaraSource And Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
            guard let cell : cellExpandable = tableView.dequeueReusableCell(withIdentifier: "cellExpandable", for: indexPath) as? cellExpandable else{
                print("Unable to create cell")
                return UITableViewCell()
            }
            
            let objExpandableModel = dataSource[indexPath.row]
            
            objExpandableModel.id = indexPath.row
            
            cell.dataModel = objExpandableModel
            cell.lblTitle.text = objExpandableModel.title
            cell.lblSubTitle.text = objExpandableModel.description
            
            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
            
            return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objModel = dataSource[indexPath.row]
        
        for item:ExpandableModel in dataSource{
            
            if item.id == objModel.id{
                item.isExpandable = !item.isExpandable
            }else{
                item.isExpandable = false
            }
        }
        
        switch expandedIndexPath {
        case .some(_) where expandedIndexPath == indexPath:
            //Click on expandable cell then close it.
            expandedIndexPath = nil
        case .some(let expandedIndex) where expandedIndex != indexPath:
            //New Cell link, already any cell expand -> old close and new expand
            expandedIndexPath = nil
            expandedIndexPath = indexPath
        default:
            //Click on Cell, no cell is expandable.
            expandedIndexPath = indexPath
        }
        
    }
    
}
