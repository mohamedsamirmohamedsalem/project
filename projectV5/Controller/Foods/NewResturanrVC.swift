//
//  NewResturanrVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import Kingfisher

class NewResturanrVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewResturantCell", for: indexPath) as! NewResturantCell
        
        ////// for get image from the internet using kingFisher
//        var stringImage = String(describing: providers[indexPath.row].image ?? "")
//        if stringImage.contains(" ") {
//            stringImage = stringImage.replacingOccurrences(of: " ", with: "%20")
//        }
//        if stringImage != "" {
//            let url = URL(string: stringImage)
//            cell.mealImage.kf.indicatorType = .activity
//            cell.mealImage.kf.setImage(with: url, placeholder: UIImage(named: "map"), options: [.transition(ImageTransition.flipFromTop(0.5))], completionHandler: nil)
//        }else {
//            print("==========> image path is empty")
//        }
        //////////////////////
        
        
        cell.mealInfoLB.text = "mohamed"
        cell.mealNameLB.text = "lala"
        return cell
    }
}
