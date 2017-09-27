//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by Stanley Pan on 27/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    
    //  MARK: Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, message: String) {
        self.profileImageView.image = profileImage
        self.emailLabel.text = email
        self.messageLabel.text = message
    }
}
