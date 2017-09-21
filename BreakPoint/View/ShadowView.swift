//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Stanley Pan on 22/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
}
