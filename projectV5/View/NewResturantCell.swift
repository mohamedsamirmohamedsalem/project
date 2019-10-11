//
//  NewResturantCell.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class NewResturantCell: UITableViewCell {

    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealNameLB: UILabel!
    @IBOutlet weak var mealInfoLB: UILabel!
    @IBOutlet weak var mealRatingLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
