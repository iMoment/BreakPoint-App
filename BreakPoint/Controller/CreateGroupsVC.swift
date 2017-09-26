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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTableView.dataSource = self
        emailTableView.delegate = self
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: profileImage!, email: "hello@world.com", isSelected: true)
        return cell
    }
}

extension CreateGroupsVC: UITableViewDelegate {
    
}






















