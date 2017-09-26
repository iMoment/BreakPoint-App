//
//  UserCell.swift
//  BreakPoint
//
//  Created by Stanley Pan on 26/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    //  MARK: Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImageView.image = image
        self.emailLabel.text = email
        if isSelected {
            self.checkImageView.isHidden = false
        } else {
            self.checkImageView.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
