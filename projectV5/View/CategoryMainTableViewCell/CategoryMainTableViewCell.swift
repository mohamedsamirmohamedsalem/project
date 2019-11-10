//
//  CategoryMainTableViewCell.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/9/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryMainTableViewCell: UITableViewCell {
    
    var containerVC : UIViewController?
    var categories = [Categories]()
    
    @IBOutlet var MainCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainCollectionViewCell.delegate = self
        MainCollectionViewCell.dataSource = self
        getCategories()
        MainCollectionViewCell.RegisterNib(Cell: CategoryCollectionViewCell.self)
    }
    
    func reloadData() {
        MainCollectionViewCell.reloadData()
    }
    func getCategories(){
        DispatchQueue.main.async {
            let url = "http://delivery.cloudtouch-test.com/api/categories"
            API.get(url:url , parameter: nil, headers: nil) { (check, Respons: [Categories]?) in
                guard let response = Respons else { return }
                self.categories = response
                self.MainCollectionViewCell.reloadData()
            }
        }
    }
}

extension CategoryMainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     //   let tempCatgories = categories[indexPath.row]
        let cell = collectionView.dequeue(IndexPath: indexPath ) as CategoryCollectionViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.categoryImage.image = #imageLiteral(resourceName: "burger")
        cell.categoryNameLabel.text =  "jsgfusvf"
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 100
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
}
