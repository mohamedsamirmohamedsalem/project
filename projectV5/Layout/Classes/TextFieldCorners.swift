//
//  TextFieldCorners.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/20/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

 class TextFieldCorners: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.clipsToBounds = true
    }
}
