//
//  BaseEntity.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation

enum ApiResult<Value, Error>{
    case success(Value)
    case failure(Error)

    init(value: Value){
        self = .success(value)
    }
    init(error: Error){
        self = .failure(error)
    }
}

enum ApiErrorType{
    case unKnown(String?)
    case unAuthenticated
    case unAuthorized
    case invalidJSON
    var description: String {
        get {
            switch self{
            case .unKnown(let val):
                return val ?? "Something Went Wrong"
            case .unAuthenticated:
              return "UnAuthenticated"
            case .unAuthorized:
              return "UnAuthorized"
            case .invalidJSON:
                return "Invalid JSON"
            }
        }
    }
}
struct ErrorResult {
    var title : String?
    var body : String?
}
