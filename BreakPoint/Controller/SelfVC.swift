//
//  SelfVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 23/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class SelfVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signoutButtonPressed(_ sender: UIButton) {
        
    }
}
