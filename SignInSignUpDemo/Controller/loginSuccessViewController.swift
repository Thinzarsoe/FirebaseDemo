//
//  loginSuccessViewController.swift
//  SignInSignUpDemo
//
//  Created by Thinzar Soe on 9/30/19.
//  Copyright © 2019 Thinzar Soe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class loginSuccessViewController: UIViewController {

    
    @IBAction func logoutBtn(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let vc = self.storyboard?.instantiateViewController(withIdentifier:"Login")
            self.present(vc!,animated: true,completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
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
