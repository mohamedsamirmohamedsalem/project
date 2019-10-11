//
//  TableViewCorners.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/5/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class TaTableViewCorners : UITableView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width/20
        
    }
}
