//
//  TextFieldPadding.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/22/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// for padding any textField
    func padding(_ textField : UITextField){
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
    }
    
}

