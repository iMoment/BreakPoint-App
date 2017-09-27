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
    
    //  MARK: Variables
    var selectedGroup: Group?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupTitleLabel.text = selectedGroup?.groupTitle
        DataService.instance.getEmails(forGroup: selectedGroup!) { (returnedEmails) in
            self.membersLabel.text = returnedEmails.joined(separator: ", ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageInputContainerView.bindToKeyboard()
    }
    
    func initData(forGroup group: Group) {
        self.selectedGroup = group
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
    }
    
}
