//
//  loginViewController.swift
//  SignInSignUpDemo
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class loginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBAction func loginBtn(_ sender: UIButton) {
        if emailTextField.text == nil || passwordTextField.text == nil{
            
            let alertController = UIAlertController(title: "Error", message: "Email of Password is not correct", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController,animated: true,completion: nil)
        }
        else{
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password:self.passwordTextField.text!) { (user, error) in
                if error == nil{
                    print("Successfully Login")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"loginSuccess")
                    self.present(vc!,animated: true,completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
