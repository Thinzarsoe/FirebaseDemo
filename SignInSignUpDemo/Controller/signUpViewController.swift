//
//  signUpViewController.swift
//  SignInSignUpDemo
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class signUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    @IBAction func createAccountAction(_ sender: UIButton) {
        
        if emailTextField.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please Enter your email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
             present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
               
                if error == nil{
                    print("You have successfully signed up")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    print("error")
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    
    @IBAction func resetPasswordBtn(_ sender: UIButton) {
         performSegue(withIdentifier: "resetPasswordSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  

}
