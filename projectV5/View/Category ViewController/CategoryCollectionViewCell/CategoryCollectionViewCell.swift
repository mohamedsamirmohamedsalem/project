//
//  CategoryCollectionViewCell.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/9/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var categoryNameLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
         self.backgroundColor = UIColor.clear
         self.backgroundView = UIView()
         self.contentView.backgroundColor = UIColor.clear
        
    }

}
