//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 22/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
    }
}
