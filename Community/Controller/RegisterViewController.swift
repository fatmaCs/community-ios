//
//  RegisterViewController.swift
//  Community
//
//  Created by Fatma on 01/02/2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextFeild.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "RegisterToCommunity", sender: self)
                }
            }
        }
        
    }
    
}
