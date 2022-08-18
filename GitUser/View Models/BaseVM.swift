//
//  BaseVM.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class BaseVM : NSObject{
    var disposeBag = DisposeBag()

//    var didUpdateData: Box<Bool?> = Box(false)
    
    var errorResult : Driver<ErrorResult>

    override init() {
        self.errorResult = Driver.never()
        errorResult.drive(onNext: { res in
            notific.post(name: _RequestErrorNotificationReceived.notification, object: res)
        },onCompleted: {
        },onDisposed: {
        }).disposed(by: disposeBag)
        super.init()
    }
    
    func RequestErrorHandler(_ error : ApiErrorType) {
        switch error {
        case .unAuthenticated:
            notific.post(name: _RequestErrorNotificationReceived.notification, object: ErrorResult.init(title: "ops", body: error.description))
            //handle unAuthenticated
            break
        case .unAuthorized:
            notific.post(name: _RequestErrorNotificationReceived.notification, object: ErrorResult.init(title: "ops", body: error.description))
            //handle unAuthenticated
            break
        case .invalidJSON:
            notific.post(name: _RequestErrorNotificationReceived.notification, object: ErrorResult.init(title: "ops", body: error.description))
            //handle unAuthenticated
            break
        case .unKnown(_):
            notific.post(name: _RequestErrorNotificationReceived.notification, object: ErrorResult.init(title: "ops", body: error.description))
            //handle unAuthenticated
            break
        }
    }
    
    func getAvatar(from url: String, to imageview: UIImageView) {
        KF.url(URL(string: url))
          .placeholder(UIImage(named: "user-placeholder"))
          .loadDiskFileSynchronously()
          .cacheMemoryOnly()
          .fade(duration: 0.25)
          .onProgress { receivedSize, totalSize in  }
          .onSuccess { result in  }
          .onFailure { error in }
          .set(to: imageview)
    }
}
