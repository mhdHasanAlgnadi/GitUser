//
//  UserInfoVM.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import UIKit
import Kingfisher

class UserInfoVM: BaseVM {
    
    var user: User?
    
    override init() {
        user = User()
        super.init()
    }
    
    func configureData(of user: User, for userInterfaceInfo: UserInterfaceInfo) {
        userInterfaceInfo.fullName.text = user.name
        userInterfaceInfo.username.text = "@\(user.login ?? "")"
        userInterfaceInfo.bio.text = user.bio ?? "no bio"
        userInterfaceInfo.location.text = user.location
        userInterfaceInfo.creationDate.text = user.created_at?.DatefromFormate_YYYY_MM_DD_HH_MM_SS_Z().toFormatte_YYYY_MM_DD2()
        userInterfaceInfo.followers.text = "\(user.followers ?? 0)"
        userInterfaceInfo.folloing.text = "\(user.following ?? 0)"
        getAvatar(from: user.avatarURL ?? "", to: userInterfaceInfo.avatar)
        userInterfaceInfo.avatar.clipsToBounds = true
        userInterfaceInfo.avatar.layer.cornerRadius = 20
    }
}


struct UserInterfaceInfo {
    var avatar: UIImageView
    var fullName, username, bio, location, creationDate: UILabel
    var followers, folloing: UILabel
}
