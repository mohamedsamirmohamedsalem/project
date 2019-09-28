//
//  Localizable.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/20/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation


extension String {
    
    //computed property
    var localized : String {
        return NSLocalizedString(self, comment: "")
    }
}
