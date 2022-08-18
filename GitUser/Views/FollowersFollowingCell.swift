//
//  FollowersFollowingCell.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import UIKit

class FollowersFollowingCell: UITableViewCell {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.borderColor = ThemeApp.Colors.primary.cgColor
        container.layer.borderWidth = 1
        self.selectionStyle = .none
    }
}
