//
//  cellExpandable.swift
//  Patrick_ExpandableCell
//
//  Created by pratik panchal on 31/12/17.
//  Copyright © 2017 pratik panchal. All rights reserved.
//

import UIKit

class cellExpandable: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewDescription: UIView!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    @IBOutlet weak var btnUpDown: UIButton!
    @IBOutlet weak var descriptionViewHeightConstraint: NSLayoutConstraint!

    
    
    var dataModel:ExpandableModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func updateConstraints() {
        
        if let dataModel = dataModel{
            if dataModel.isExpandable == true{
                self.descriptionViewHeightConstraint.priority = UILayoutPriority(rawValue: 740)
                self.btnUpDown.setImage(#imageLiteral(resourceName: "ic_up"), for: .normal)
            }else{
                self.btnUpDown.setImage(#imageLiteral(resourceName: "ic_down"), for: .normal)
                self.descriptionViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
            }
        }
        super.updateConstraints()
    }
    
}
