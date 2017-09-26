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

    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.dataSource = self
        groupsTableView.delegate = self
    }
}

extension GroupsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        cell.configureCell(title: "Hello", description: "Hello World", memberCount: 5)
        return cell
    }
}

extension GroupsVC: UITableViewDelegate {
    
}
