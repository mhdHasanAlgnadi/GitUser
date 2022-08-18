//
//  Communication.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import Alamofire
//import AlamofireObjectMapper
import SwiftyJSON
import RxSwift
import RxCocoa

var notific = NotificationCenter.default
let _CommeToForground = "CommeToForground"
let _RequestErrorNotificationReceived = "RequestErrorNotificationReceived"
var disposeBag = DisposeBag()
class Communication {
    
    static let shared = Communication()
    let encodingJson = JSONEncoding.default
    
    func getHearders(_ auth : Bool = false) -> [String : String]{
        let headers =
            [
              "Accept": "application/json",
              "Content-Type" : "application/json",
            ]
        return headers
    }
    
    func output(_ res : DataResponse<Data>) -> Void{
        Print("api tracking")
        var ans = ""
        if let urlString = res.request?.url?.absoluteString{
            ans += urlString + "\n"
            Print(urlString)
        }
        
        if let bod = res.request?.httpBody, let body = NSString(data: bod, encoding: String.Encoding.utf8.rawValue){
            ans += (body as String) + "\n"

            Print(body)
        }
        if let h = res.request?.allHTTPHeaderFields{
            ans += (h.toJSONString ?? "") + "\n"

            Print(h)
        }
        if let data = res.data, let s = NSString(data: data, encoding: String.Encoding.utf8.rawValue){
            ans += "\(s)"
            Print(s)
        }
    }
    
    /// call this function in order to call any end-point
    ///
    /// - warning: Be carefull! don't pass any value For VC in case to call it in background
    /// - parameter VC: the current ViewController , in case if you want to show,hide loader for the request
    /// - parameter Url: URL of the Request
    /// - parameter method: HTTPMethod of the Request
    /// - parameter params: Payload of the Request
    /// - parameter objectType: Model of the Request
    /// - returns: callback of objectType , callbackMessage of String value in case you want to show it
    func SendRequest<T: Decodable>(Url : String,method: HTTPMethod,params : [String : Any],objectType: T.Type)-> Observable<ApiResult<T, ApiErrorType>>{
        return Observable.create { [self] observer in
            let task = Alamofire.request(URL(string: Url)!, method: method,parameters: method != .get ? params : nil, encoding: self.encodingJson , headers: self.getHearders(true)).responseData() {
                (response ) in
                #if DEBUG
                self.output(response)
                #endif
                let statusCode = response.response?.statusCode ?? 0;
                switch response.result{
                    case .success(let value):
                        guard statusCode >= 200 , statusCode < 299 ,let m = try? JSONDecoder().decode(objectType, from:value) else {
                            observer.on(.next(.init(error: ApiErrorType.invalidJSON)))
                            observer.onCompleted()
                            return
                        }
                        guard statusCode != 401 else {
                            observer.on(.next(.init(error: ApiErrorType.unAuthenticated)))
                            observer.onCompleted()
                            return
                        }
                        guard statusCode != 403 else {
                            observer.on(.next(.init(error: ApiErrorType.unAuthorized)))
                            observer.onCompleted()
                            return
                        }
                        observer.on(.next(.init(value: m)))
                        observer.onCompleted()
                        break
                    case .failure(let error):
                        observer.on(.next(.init(error: ApiErrorType.unKnown(error.localizedDescription))))
                        observer.on(.error(error))
                        observer.onCompleted()
                        break
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
}


func Print(_ items: Any..., separator: String = " ", terminator: String = "\n"){
    #if DEBUG
    print(items,separator,terminator)
    #endif
}
