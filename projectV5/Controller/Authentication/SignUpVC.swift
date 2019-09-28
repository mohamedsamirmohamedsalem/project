//
//  SignUpVC.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/15/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var userNameLB: UITextField!
    @IBOutlet weak var emailLB: UITextField!
    @IBOutlet weak var passwordLB: UITextField!
    @IBOutlet weak var confirmPasswordLB: UITextField!
    @IBOutlet weak var phoneLB: UITextField!
    
    override func viewDidLoad() {
       updateUI()
    }
    
    
    @IBAction func BackBut(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logInBut(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        present(vc, animated: true, completion: nil)
    }
    
    func updateUI(){
         userNameLB.padding(userNameLB)
         emailLB.padding(emailLB)
        passwordLB.padding(passwordLB)
         confirmPasswordLB.padding(confirmPasswordLB)
         phoneLB.padding(phoneLB)
    }
    @IBAction func signUpBut(_ sender: UIButton) {
        
        self.view.endEditing(true)
        let email=emailLB.text ?? ""
        let phone=phoneLB.text ?? ""
        let userName=userNameLB.text ?? ""
        let password=passwordLB.text ?? ""
        let confirmPassword=confirmPasswordLB.text ?? ""
        
        //shake() all textFields if there are empty
         if (email.isEmpty && userName.isEmpty && password.isEmpty && confirmPassword.isEmpty  && phone.isEmpty){
            emailLB.shake()
            userNameLB.shake()
            passwordLB.shake()
            confirmPasswordLB.shake()
            phoneLB.shake()
        }
        
        if !(email.isEmpty || phone.isEmpty || userName.isEmpty || password.isEmpty || confirmPassword.isEmpty) &&  password == confirmPassword && SignUpVC.isValidEmail(emailStr: email){
            
            let url = "http://delivery.cloudtouch-test.com/api/post/register"
            let parameter = ["email": email , "phone_number":phone,"name":userName,"type":"client","password":password]
            DispatchQueue.main.async {
            API.post(url, parameter: parameter, headers: nil) { (check, Response : RegisterResponse?) in
                    if check{
                        guard let response = Response else {return}
                        if response.status == 1{
                            print("This is the server response======>\(response.apiToken ?? "Default ApiToken")")
                        }else{
                             print(response.message ?? "Duplication")
                        }
                    }
                }
            }
        }else{
            if userName.isEmpty {
                userNameLB.shake()
            }
            else if email.isEmpty || !SignUpVC.isValidEmail(emailStr: email){
                emailLB.shake()
            }else if password.isEmpty{
                passwordLB.shake()
            }else if confirmPassword.isEmpty || password != confirmPassword {
                confirmPasswordLB.shake()
            }else if phone.isEmpty {
                phoneLB.shake()
            }else {
                print("UnKnown Error")
            }
            
        }
        
    }
    //to check for validation of email
    class func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
}
