//
//  ViewController.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/15/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import MOLH

class ViewController: UIViewController {

    @IBOutlet weak var happyMealLabel: UILabel!
    @IBOutlet weak var secondLB: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var ButtomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func getStartedButtonAc(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "OnBoardVC") as! OnBoardVC
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func menuBut(_ sender: UIButton) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() 	== "en" ? "ar" : "en")
        MOLH.reset()
    }
    
}
