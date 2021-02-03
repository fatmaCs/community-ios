//
//  LogInViewController.swift
//  Community
//
//  Created by Fatma on 01/02/2021.
//

import UIKit
import Firebase
class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  

    @IBAction func loginPressed(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error{
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "LogInCommunity", sender: self)
                }
            }
        }
    }
    

}
