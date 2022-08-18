//
//  ViewController.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import UIKit

class SearchForUserVC: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    var searchForUserVM = SearchForUserVM()
    var savedUsers = [SavedUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        savedUsers = CoreDataManager.shared.fetchUser()
    }

    @IBAction func onSearch(_ sender: UIButton) {
        
        if savedUsers.count > 0 {
            if let user = savedUsers.first(where: {$0.login == username.text}){
                let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                let VC = storyboard.instantiateViewController(withIdentifier: "UserInfoVC") as! UserInfoVC
                VC.user = CoreDataManager.shared.parseModel(user)
                navigationController?.pushViewController(VC, animated: true)
                return
            }
        }
        LoaderUtility.shared.show(inView: view)
        searchForUserVM.getUser(username: username.text ?? "")
            .subscribe(onNext: {[weak self] response in
                LoaderUtility.shared.hide()
                let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                let VC = storyboard.instantiateViewController(withIdentifier: "UserInfoVC") as! UserInfoVC
                VC.user = response
                self?.navigationController?.pushViewController(VC, animated: true)
            }, onError: {[weak self] error in
                self?.showMessage(message: "Error", theme: .error)
                LoaderUtility.shared.hide()
            }, onCompleted: {
                LoaderUtility.shared.hide()
            }).disposed(by: disposeBag)

    }
    
}
