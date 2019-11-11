//
//  PopularChoicesCollectionViewCell.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/10/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class PopularChoicesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var popularChoicesImage: UIImageView!
    @IBOutlet var popularChoicesNameLabel: UILabel!
    @IBOutlet var popularChoicesDiscriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.backgroundView = UIView()
        self.contentView.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func showAllpopularChoices(_ sender: UIButton) {
    }
}
