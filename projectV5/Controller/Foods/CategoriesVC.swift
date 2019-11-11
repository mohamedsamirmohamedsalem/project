//
//  CategoriesVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/9/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    var providers : [ProvidersByCatagories]?
    //MARK :- IBOutlets
    @IBOutlet var TableView: UITableView!
    @IBOutlet var SearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchBar.delegate = self
        TableView.delegate = self
        TableView.dataSource = self
        providers = [ProvidersByCatagories]()
        setTableView()
        
    }
    
    func setTableView(){
        
        TableView.estimatedRowHeight = 100
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor = UIColor.clear
        
        TableView.RegisterNib(Cell: CategoryMainTableViewCell.self)
        TableView.RegisterNib(Cell: ProvidersTableViewCell.self)
        
        // remove lines before and after search bar
        SearchBar.backgroundImage = UIImage()
        TableView.separatorStyle = .none
        TableView.reloadData()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProviders()
        print("====================>\(providers?.count)")
        self.TableView.reloadData()
        self.TableView.beginUpdates()
        self.TableView.endUpdates()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
     }
    /////////////////////////////////////////////////////////////////////////////////
    func getProviders(){
        DispatchQueue.main.async {
            let url = "http://delivery.cloudtouch-test.com/api/providers?"
            API.get(url: url, parameter: nil, headers: nil
                , completion: { (check, Response : [ProvidersByCatagories]?) in
                    guard let response = Response else {return}
                    self.providers = response
                    self.TableView.reloadData()
            })
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
 
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("sideMenu"), object: nil)
    }
    
    @IBAction func goTo_popularChoices_VC(_ sender: UIButton) {
        shouldPerformSegue(withIdentifier: "PopularChoicesVC", sender: nil)
    }
    @IBAction func getMyLocation(_ sender: UIButton) {
        shouldPerformSegue(withIdentifier: "MapKitVC", sender: nil)
    }
}


///////////////////////////////////////////////////////////////////////
extension CategoriesVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return 1}
        else{
            if providers?.count == 0{
                return 5
            }
            else {
                return providers!.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
              return SCREEN_WIDTH / 2.76 // which = 150
        }else{
            return SCREEN_HEIGHT / 2.6
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeue(IndexPath: indexPath) as CategoryMainTableViewCell
            cell.selectionStyle = .none
            cell.reloadData()
            return cell
        }else {
            let cell = tableView.dequeue(IndexPath: indexPath) as ProvidersTableViewCell
            cell.providerImage.image = #imageLiteral(resourceName: "Fast Delivery")
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension CategoriesVC : UISearchBarDelegate {
    
}
