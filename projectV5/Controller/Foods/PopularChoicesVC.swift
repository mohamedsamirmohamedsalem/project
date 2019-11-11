//
//  PopularChoicesVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/5/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class PopularChoicesVC: UIViewController {
    
    
    var NewResturant : [NewResturants]?
    //MARK :- IBOutlets
    @IBOutlet var SearchBar: UISearchBar!
    @IBOutlet var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        SearchBar.delegate = self
        NewResturant = [NewResturants]()
        setTableView()
    }
    
    func setTableView(){
        
        TableView.estimatedRowHeight = 320
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor = UIColor.clear
        
        TableView.RegisterNib(Cell: PopularChoicesMainTableViewCell.self)
        TableView.RegisterNib(Cell: NewResturantsTableViewCell.self)
    
        // remove lines before and after search bar
        SearchBar.backgroundImage = UIImage()
        TableView.separatorStyle = .none
        TableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getPopChoices()
        self.TableView.reloadData()
        self.TableView.beginUpdates()
        self.TableView.endUpdates()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func getPopChoices(){
        DispatchQueue.main.async {
            let url = "http://delivery.cloudtouch-test.com/api/providers?"
            API.get(url: url, parameter: nil, headers: nil
                , completion: { (check, Response : [NewResturants]?) in
                    guard let response = Response else {return}
                    self.NewResturant = response
                    self.TableView.reloadData()
            })
        }
    }
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("sideMenu"), object: nil)
    }
    @IBAction func showAll_PopularChoices(_ sender: UIButton) {
    }
}

extension PopularChoicesVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 370
        }else{
            return SCREEN_HEIGHT / 8
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return 1}
        else{
            if NewResturant?.count == 0{
                return 5
            }
            else {
                return NewResturant!.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            print("============================")
            let cell = tableView.dequeue(IndexPath: indexPath) as PopularChoicesMainTableViewCell
            cell.selectionStyle = .none
            cell.reloadData()
            return cell
        }else {
            let cell = tableView.dequeue(IndexPath: indexPath) as NewResturantsTableViewCell
            cell.restaurantImage.image = #imageLiteral(resourceName: "Mohamed samir")
            return cell
        }
    }
}

extension PopularChoicesVC : UISearchBarDelegate {
    
}
