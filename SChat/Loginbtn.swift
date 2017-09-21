
//
//  Loginbtn.swift
//  SChat
//
//  Created by Nikolai Dirks on 21/09/2017.
//  Copyright © 2017 NSD. All rights reserved.
//

import UIKit

class Loginbtn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)

        layer.cornerRadius = 3.0
    }

}
