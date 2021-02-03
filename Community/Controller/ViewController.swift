//
//  ViewController.swift
//  Community
//
//  Created by Fatma on 31/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

 
}

