//
//  FollowersFollowingsListVC.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import UIKit

class FollowersFollowingsListVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var user: User?
    var users : Users = []
    var followersVM = FollowersFollowingVM()
    var userType : UsersType = .followers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        fetchData()
    }
    
    func fetchData() {
        LoaderUtility.shared.show(inView: view)
        if userType == .followers {
            followersVM.fetchFollowers(for: user ?? User()).subscribe(onNext: {[weak self] response in
                LoaderUtility.shared.hide()
                self?.users.append(contentsOf: response)
                self?.tableview.reloadData()
            }, onError: { error in
                
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
        } else {
            followersVM.fetchFollowing(for: user ?? User()).subscribe(onNext: {[weak self] response in
                LoaderUtility.shared.hide()
                self?.users.append(contentsOf: response)
                self?.tableview.reloadData()
            }, onError: { error in
                
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
        }
    }
}


extension FollowersFollowingsListVC : UITableViewDelegate , UITableViewDataSource {
    func initTableView() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowersFollowingCell", for: indexPath) as! FollowersFollowingCell
        let thisUser = users[indexPath.row]
        cell.username.text = "@\(thisUser.login ?? "")"
        followersVM.getAvatar(from: thisUser.avatarURL ?? "", to: cell.avatar)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == users.count {
            if user?.followers ?? 0 != users.count && userType == .followers {
                fetchData()
            } else if user?.following ?? 0 != users.count && userType == .following {
                fetchData()
            }
        }
    }
}
