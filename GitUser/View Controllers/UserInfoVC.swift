//
//  UserInfoVC.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import UIKit

class UserInfoVC: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var informationContainer: UIView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var numberOfFollowers: UILabel!
    @IBOutlet weak var numberOfFollowing: UILabel!
    
    var user: User?
    var userVM = UserInfoVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationContainer.addShadow(cornerRadius: 10)
        let interfaceInfo = UserInterfaceInfo(avatar: avatar, fullName: fullName, username: username, bio: bio, location: location, creationDate: creationDate, followers: numberOfFollowers, folloing: numberOfFollowing)
        if let user = user {
            userVM.configureData(of: user, for: interfaceInfo)
        } else {
            
        }
    }
    @IBAction func onGoToFollowers(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let VC = storyboard.instantiateViewController(withIdentifier: "FollowersFollowingsListVC") as! FollowersFollowingsListVC
        VC.user = user
        VC.userType = .followers
        self.navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func onGoToFollowing(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let VC = storyboard.instantiateViewController(withIdentifier: "FollowersFollowingsListVC") as! FollowersFollowingsListVC
        VC.user = user
        VC.userType = .following
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
