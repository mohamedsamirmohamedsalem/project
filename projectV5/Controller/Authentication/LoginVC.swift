//
//  LoginVC.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/16/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import MOLH

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailLB: UITextField!
    @IBOutlet weak var passwordLB: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonToTextField(passwordLB)
        updateUI()
        
    }
    
    @IBAction func backBut(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signUpBut(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logInBut(_ sender: UIButton) {
        // hide keyboard when touch up screen
        self.view.endEditing(true)
        let email = emailLB.text ?? ""
        let password = passwordLB.text ?? ""
        //shake() all textFields if there are empty
        if email.isEmpty && password.isEmpty {
            passwordLB.shake()
            emailLB.shake()
        }else if email.isEmpty {
            emailLB.shake()
        }else if password.isEmpty {
            passwordLB.shake()
        }
        
        if !email.isEmpty && !password.isEmpty{
            let url = "http://delivery.cloudtouch-test.com/api/post/login"
            let parameter = ["user_name":email, "password":password]
            
            DispatchQueue.main.async {
                API.post(url, parameter: parameter, headers: nil) { (check, Response : LogInResponse?) in
                    if check {
                        guard let response = Response else {return}
                        if response.status == 1 {
                            if let api_token = response.api_token {
                                UserDefaults.standard.set(api_token, forKey: "api_token")
                                UserDefaults.standard.synchronize()
                                print(response.api_token ?? "Default Api_Token")
                                MOLH.reset()
                            }
                            if let user = response.user{
                                UserDefaults.standard.set(user.phoneNumber, forKey: "phoneNumber")
                                UserDefaults.standard.synchronize()
                                UserDefaults.standard.set(user.name, forKey: "name")
                                UserDefaults.standard.synchronize()
                                UserDefaults.standard.set(user.city, forKey: "city")
                                UserDefaults.standard.synchronize()
                                UserDefaults.standard.set(user.email, forKey: "email")
                                UserDefaults.standard.synchronize()
                                UserDefaults.standard.set(user.address, forKey: "address")
                                UserDefaults.standard.synchronize()
                                UserDefaults.standard.set(user.id, forKey: "id")
                                UserDefaults.standard.synchronize()
                                
                            }
                            print("==========>you have been loged in ")
                        }else{
                            if (!email.isEmpty && !password.isEmpty){
                            let alert = UIAlertController(title: "Warnning", message: "Wrong email or password", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                            alert.addAction(action)
                            self.present(alert, animated: true, completion: nil)
                            print( response.message ?? "Wrong email or password")
                            }
                            else if email.isEmpty {
                                self.emailLB.shake()
                            }else if password.isEmpty {
                                self.passwordLB.shake()
                            }
                        }
                    }else {
                        let alert = UIAlertController(title: "Warnning", message: "check your internet connection", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        print( "check your internet connection")
                    }
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////
    func updateUI(){
        emailLB.padding(emailLB)
        passwordLB.padding(passwordLB)
    }
    ///////////////////////////////////////////////////////////////////////////////////////////
    //add button to textfield password
    fileprivate func addButtonToTextField(_ textField : UITextField){
        let button = UIButton(type: .custom)
        button.setTitle("Forget", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9446642399, green: 0.3604849875, blue: 0.3527566791, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 17)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16 , bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(passwordLB.frame.width-25), y: CGFloat(5), width: CGFloat(70), height: CGFloat(passwordLB.frame.height))
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
    }
    
    @objc func buttonAction(){
        let story = UIStoryboard(name:"Main",bundle: nil).instantiateViewController(withIdentifier:"tabBarController")
        present(story, animated: true, completion: nil)
       
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////
}
