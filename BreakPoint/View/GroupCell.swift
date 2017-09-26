//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Stanley Pan on 26/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    //  MARK: Outlets
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLabel.text = title
        self.groupDescriptionLabel.text = description
        self.membersLabel.text = "\(memberCount) members"
    }
}
