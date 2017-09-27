//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 27/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit
import Firebase

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
    var groupMessages = [Message]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupTitleLabel.text = selectedGroup?.groupTitle
        DataService.instance.getEmails(forGroup: selectedGroup!) { (returnedEmails) in
            self.membersLabel.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.retrieveAllMessagesFor(desiredGroup: self.selectedGroup!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.groupFeedTableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.groupFeedTableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageInputContainerView.bindToKeyboard()
        self.groupFeedTableView.dataSource = self
        self.groupFeedTableView.delegate = self
    }
    
    func initData(forGroup group: Group) {
        self.selectedGroup = group
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismissDetail()
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendButton.isEnabled = false
            DataService.instance.insertPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: selectedGroup?.key, insertComplete: { (isComplete) in
                if isComplete {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendButton.isEnabled = true
                }
            })
        }
    }
}

extension GroupFeedVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderID) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, message: message.content)
        }
        return cell
    }
}

extension GroupFeedVC: UITableViewDelegate {
    
}
















