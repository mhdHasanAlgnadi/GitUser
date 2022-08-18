//
//  SearchForUserVM.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import UIKit
import RxSwift

enum MyError: Error {
    case anError
}

class SearchForUserVM: BaseVM {
//    var disposeBag = DisposeBag()
    override init() {
        super.init()
    }
    
    func getUser(username: String) -> Observable<User> {
        return Observable.create { [weak self] observer in
            let url = API.user.replacingOccurrences(of: "{ID}", with: username, options: .literal, range: nil)
            let rx = Communication.shared.SendRequest(Url: url, method: .get, params: [:], objectType: User.self)
            rx.subscribe(onNext: { response in
                switch response{
                case .success(let user):
                    CoreDataManager.shared.create(user)
                    observer.on(.next(user))
                    break
                case .failure(let error):
                    observer.on(.error(MyError.anError))
                    self?.RequestErrorHandler(error)
                    break
                }
              },onError: { (error) in
                observer.on(.error(error))
              },onCompleted: {
                observer.onCompleted()
              })
            .disposed(by: self?.disposeBag ?? DisposeBag())
            
            return Disposables.create()
        }
    }
    
}
