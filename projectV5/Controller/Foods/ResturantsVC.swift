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
    
    @IBOutlet weak var categoriesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
}

extension RestaurantsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        
        ////// for get image from the internet
        var stringImage = String(describing: categories[indexPath.row].image ?? "")
        if stringImage.contains(" ") {
            stringImage = stringImage.replacingOccurrences(of: " ", with: "%20")
        }
        if stringImage != "" {
            let url = URL(string: stringImage)
            cell.categoriesImage.kf.indicatorType = .activity
            cell.categoriesImage.kf.setImage(with: url, placeholder: UIImage(named: "map"), options: [.transition(ImageTransition.flipFromTop(0.5))])
        }
        //////
        cell.categoriesLB.text = categories[indexPath.row].name ?? ""
        return cell
    }
    
    //// resizing the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoriesCV.frame.width/3.5, height: categoriesCV.frame.height - 30)
    }
    
}
