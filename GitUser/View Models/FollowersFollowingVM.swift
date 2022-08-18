//
//  FollowersFollowingVM.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import UIKit
import RxSwift
import SwiftMessages
class FollowersFollowingVM: BaseVM {
    
    var users : Users = []
    
    override init() {
        super.init()
        
    }
    
    func fetchFollowers(for user: User) -> Observable<Users> {
        return Observable.create {[weak self] observer in
            let url = self?.parseURL(with: .followers, for: user)
            self?.getDataFrom(url: url ?? "", observer: observer)
            return Disposables.create()
        }
        
    }
    
    func fetchFollowing(for user: User) -> Observable<Users> {
        return Observable.create {[weak self] observer in
            let url = self?.parseURL(with: .following, for: user)
            self?.getDataFrom(url: url ?? "", observer: observer)
            return Disposables.create()
        }
    }
    
    private func getDataFrom(url: String, observer: AnyObserver<Users>)  {
        let rx = Communication.shared.SendRequest(Url: url , method: .get, params: [:], objectType: Users.self)
        rx.subscribe(onNext: {[weak self] response in
            switch response{
            case .success(let users):
                self?.users.append(contentsOf: users)
                observer.on(.next(users))
                break
            case .failure(let error):
                self?.RequestErrorHandler(error)
                break
            }
        }, onError: {[weak self] error in
            self?.RequestErrorHandler(.unKnown(error.localizedDescription))
        }, onCompleted: {
            
        }, onDisposed: {
            
        })
    }
    
    private func parseURL(with type: UsersType, for user: User) -> String {
        var baseURL = ""
        if type == .followers {
            baseURL = API.followers
        } else {
            baseURL = API.following
        }
        let urlPartOnw = baseURL.replacingOccurrences(of: "{User}", with: user.login ?? "", options: .literal, range: nil)
        let urlPartTwo = urlPartOnw.replacingOccurrences(of: "{PageSize}", with: "10", options: .literal, range: nil)
        let finalURL = urlPartTwo.replacingOccurrences(of: "{PageNumber}", with: "\((users.count/10)+1)", options: .literal, range: nil)
        return finalURL
    }
}

enum UsersType {
    case followers
    case following
}
