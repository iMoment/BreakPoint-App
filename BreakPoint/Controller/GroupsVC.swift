//
//  GroupsVC.swift
//  BreakPoint
//
//  Created by Stanley Pan on 21/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var groupsTableView: UITableView!
    
    //  MARK: Variables
    var groupsArray = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.dataSource = self
        groupsTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.groupsTableView.reloadData()
            }
        }
    }
}

extension GroupsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDescription, memberCount: group.memberCount)
        return cell
    }
}

extension GroupsVC: UITableViewDelegate {
    
}
