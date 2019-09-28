//
//  LabelCorners.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/20/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//


import UIKit

 class LabelCorners: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.9438288808, green: 0.3566709757, blue: 0.3653410375, alpha: 1)
        self.clipsToBounds = true
    }
}
