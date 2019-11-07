//
//  GeneralSideMenuVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/5/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class GeneralSideMenuVC: UIViewController {
    
    //MARK :-  IBOutlets
    @IBOutlet weak var sideMenuContrain: NSLayoutConstraint!
    @IBOutlet weak var sideMenuContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //send notifiation to all viewControllers
        NotificationCenter.default.addObserver(self, selector: #selector(showSideMenu(_:)), name: NSNotification.Name("sideMenu"), object: nil)
    }
    
    @objc func showSideMenu(_ notify:NSNotification){
        UIView.animate(withDuration: 0.3) {
            if self.sideMenuContrain.constant == 0 {
                self.sideMenuContrain.constant = -1 * self.sideMenuContainerView.frame.width
            }else{
                self.sideMenuContrain.constant = 0
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func hideSideMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.sideMenuContrain.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}
