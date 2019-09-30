//
//  resetPasswordViewController.swift
//  SignInSignUpDemo
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class resetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func resetPasswordBtn(_ sender: UIButton) {
        
        if emailTextField.text == ""{
            
            let alertController = UIAlertController(title: "Error", message: "Please Enter your email address", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController,animated: true,completion: nil)
        }
        
        else{
            let firebaseAuth = Auth.auth()
           
            var title = ""
            var message = ""
            firebaseAuth.sendPasswordReset(withEmail:self.emailTextField.text!,completion:{ (error) in
                
                if error != nil{
                    title = "Error!"
                    message = error?.localizedDescription ?? ""
                }
                
                else{
                     title = "Success!"
                    message = "Reset Password will be sent"
                    self.emailTextField.text = ""
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"Login")
                    self.present(vc!,animated: true,completion: nil)
                }
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
               
                
            })
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
