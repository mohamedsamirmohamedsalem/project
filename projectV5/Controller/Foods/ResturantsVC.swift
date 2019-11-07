//
//  ResturantsVC.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantsVC: UIViewController {
    
    
    var categories = [Categories]()
     var providers = [ProvidersByCatagories]()
    
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var bottomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomTableView.estimatedRowHeight = bottomTableView.frame.height/1.5
        
    }
    @IBAction func sideMenuButt(_ sender: UIButton) {
       NotificationCenter.default.post(name: NSNotification.Name("sideMenu"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            let url = "http://delivery.cloudtouch-test.com/api/categories"
            API.get(url:url , parameter: nil, headers: nil) { (check, Respons: [Categories]?) in
                guard let response = Respons else { return }
                self.categories = response
                self.categoriesCV.reloadData()
                
            }
        }
        DispatchQueue.main.async {
            let url = "http://delivery.cloudtouch-test.com/api/providers?"
            API.get(url: url, parameter: nil, headers: nil
                , completion: { (check, Response : [ProvidersByCatagories]?) in
                    guard let response = Response else {return}
                    self.providers = response
                    self.bottomTableView.reloadData()
            })
        }
    }

}

extension RestaurantsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Localcategories = categories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        ////// for get image from the internet using kingFisher
        var stringImage = String(describing: Localcategories.image ?? "")
        if stringImage.contains(" ") {
            stringImage = stringImage.replacingOccurrences(of: " ", with: "%20")
        }
        if stringImage != "" {
            let url = URL(string: stringImage)
            cell.categoriesImage.kf.indicatorType = .activity
            cell.categoriesImage.kf.setImage(with: url, placeholder: UIImage(named: "map"), options: [.transition(ImageTransition.flipFromTop(0.5))])
        }
        //////
        cell.categoriesLB.text = Localcategories.name ?? ""
        return cell
    }
    
    //// resizing the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoriesCV.frame.width/3.5, height: categoriesCV.frame.height - 30)
    }
}
