//
//  AccountVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/10/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    //MARK :- Instances
    var tableData = ["Profile","Payment Method","Order History","Delivery Address","Setting","About us","Support Center"]
    //MARK :- IBOutlets
    @IBOutlet var accountImage: UIImageView!{
        didSet{

            accountImage.layer.borderWidth = 0.5
          accountImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            accountImage.layer.cornerRadius = accountImage.frame.width/2
          accountImage.clipsToBounds = true
        }
    }
    @IBOutlet var accountNameLabel: UILabel!
    @IBOutlet var accountEmailLabel: UILabel!
    @IBOutlet var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        // delete seprated lines after end of table lines
        TableView.tableFooterView = UIView()

    }

}

extension AccountVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountVC", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        // to add disclosure Indicator (arrow) in each cell
        cell.accessoryType = .disclosureIndicator
        /* if you want to change corol of indicator
        // set image graater than in each cell
        if #available(iOS 13.0, *) {
            let image = UIImage(systemName: "greaterthan")
            cell.accessoryView = UIImageView(image: image)
        } else {
            // Fallback on earlier versions
        }
       */
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
