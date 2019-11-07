//
//  PopularChoicesVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/5/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class PopularChoicesVC: UIViewController ,UICollectionViewDataSource , UICollectionViewDelegate {

    //MARK :- IBOutlets
    @IBOutlet weak var collectionViewOut: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOut.delegate = self
        collectionViewOut.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularChociesCell", for: indexPath) as! PopularChociesCell
        ////// for get image from the internet using kingFisher
     
        //////
        cell.mealInfoLB.text = "mohamed"
        cell.mealNameLB.text = "lala"
        return cell
    }
    
  
    
}
