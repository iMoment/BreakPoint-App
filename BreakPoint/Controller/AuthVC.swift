//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 22/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    //  MARK: Outlets
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func googleButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        self.present(loginVC!, animated: true, completion: nil)
    }
}
