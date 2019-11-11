//
//  PopularChoicesMainTableViewCell.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/10/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class PopularChoicesMainTableViewCell: UITableViewCell {

  
    var popChoices : [PopularChoices]?
    
    @IBOutlet var MainCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        MainCollectionViewCell.delegate = self
        MainCollectionViewCell.dataSource = self
        popChoices = [PopularChoices]()
        getPopChoices()
        MainCollectionViewCell.RegisterNib(Cell: PopularChoicesCollectionViewCell.self)
    }
    
    func reloadData() {
        MainCollectionViewCell.reloadData()
    }
    func getPopChoices(){
        DispatchQueue.main.async {
            let url = "http://delivery.cloudtouch-test.com/api/categories"
            API.get(url:url , parameter: nil, headers: nil) { (check, Respons: [PopularChoices]?) in
                guard let response = Respons else { return }
                self.popChoices = response
                self.MainCollectionViewCell.reloadData()
            }
        }
    }
}

extension PopularChoicesMainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if popChoices?.count == 0 {
                  return 10
              }else{
                  return popChoices!.count
              }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     //   let tempCatgories = categories[indexPath.row]
        let cell = collectionView.dequeue(IndexPath: indexPath ) as PopularChoicesCollectionViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.popularChoicesImage.image = #imageLiteral(resourceName: "Mohamed samir")
        cell.popularChoicesNameLabel.text = "resturant name"
        cell.popularChoicesDiscriptionLabel.text = "resturant name"
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (3/4)*SCREEN_WIDTH 
        let height: CGFloat = 300
        return CGSize(width: width, height: height)
    }
    
}
