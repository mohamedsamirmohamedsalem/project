//
//  OnBoardVC.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/15/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class OnBoardVC: UIViewController {
    
    // Constants
    //Instance Variables
    /////for timer using
    var scrollCurentIndex = 0
    var timer : Timer?
    let imageArray : [UIImage] = [#imageLiteral(resourceName: "onBoardFood "),#imageLiteral(resourceName: "menu icon "),#imageLiteral(resourceName: "Happy Meal "),#imageLiteral(resourceName: "Happy Meal "),#imageLiteral(resourceName: "onBoardFood ")]
    let firstLabelArray : [String] = ["Find Foods You Love","Fast Delivery","Live Tracking","Find Foods You Love","Fast Delivery"]
    let secondLabelArray : [String] = ["Discover the best foods from over 1,000 resturant","Fast delivery to your home,office and wherever you are","Real live tracking of your food on the app after ordered","Find Foods You Love","Fast Delivery"]
    
    
    //Pre-linked IBOutlet
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var createAccountBut: UIButton!
    @IBOutlet weak var continuWithFacebookBut: UIButton!
    
    /////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController.numberOfPages = imageArray.count
        startTimer()
    }
    
    /////////////////////////////////////

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(go), userInfo: nil, repeats: true)
    }
    @IBAction func continueWithFacebook(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @objc func go(){
        let scrollPosition = scrollCurentIndex < imageArray.count - 1 ? scrollCurentIndex + 1 : 0
        print(scrollCurentIndex)
        collectionView.scrollToItem(at: IndexPath(item: scrollPosition, section: 0), at: .centeredHorizontally, animated: true)
        

    }
    @IBAction func createAccountBut(_ sender: UIButton) {
        timer?.invalidate()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func LoginBut(_ sender: UIBarButtonItem) {
      
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        present(vc, animated: true, completion: nil)
    }
}
////////////////////////////////////////////////////////////////////////////////////////

extension OnBoardVC : UICollectionViewDelegate  , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardCell", for: indexPath) as! OnBoardCell
        cell.onBoardImage.image = imageArray[indexPath.row]
        cell.firstLB.text = firstLabelArray[indexPath.row]
        cell.secondLB.text = secondLabelArray[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollCurentIndex = Int(scrollView.contentOffset.x / collectionView.frame.width)
        pageController.currentPage = scrollCurentIndex
    }
    
}
