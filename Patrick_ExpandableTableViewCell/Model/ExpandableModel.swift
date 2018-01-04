//
//  ExpandableModel.swift
//  Patrick_ExpandableCell
//
//  Created by pratik panchal on 31/12/17.
//  Copyright © 2017 pratik panchal. All rights reserved.
//

import Foundation


class ExpandableModel {
    
    var id: Int = 0
    var title : String?
    var description : String?
    var isExpandable : Bool = false
    
    init(title : String? , description : String? , isExpandable : Bool = false )
    {
        self.title = title
        self.description = description
        self.isExpandable = isExpandable
    }
}
