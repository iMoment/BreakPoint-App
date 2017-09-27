//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 27/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var groupFeedTableView: UITableView!
    @IBOutlet weak var messageInputContainerView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageInputContainerView.bindToKeyboard()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
    }
    
}
