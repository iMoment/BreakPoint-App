//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 25/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var groupMembersLabel: UILabel!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var emailTableView: UITableView!
    
    //  MARK: Variables
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doneButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTableView.dataSource = self
        emailTableView.delegate = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray.removeAll(keepingCapacity: false)
            emailTableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.emailTableView.reloadData()
            })
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
    }
}

extension CreateGroupsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        
        if chosenUserArray.contains(emailArray[indexPath.row]) {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: false)
        }
        
        return cell
    }
}

extension CreateGroupsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUserArray.contains(cell.emailLabel.text!) {
            chosenUserArray.append(cell.emailLabel.text!)
            groupMembersLabel.text = chosenUserArray.joined(separator: ", ")
            doneButton.isHidden = false
        } else {
            chosenUserArray = chosenUserArray.filter({ $0 != cell.emailLabel.text! })
            if chosenUserArray.count >= 1 {
                groupMembersLabel.text = chosenUserArray.joined(separator: ", ")
            } else {
                groupMembersLabel.text = "ADD PEOPLE TO YOUR GROUP"
                doneButton.isHidden = true
            }
        }
    }
}

extension CreateGroupsVC: UITextFieldDelegate {
    
}





















