//
//  API.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
class API: NSObject {
    public static var user: String = "https://api.github.com/users/{ID}"
    public static var followers : String = "https://api.github.com/users/{User}/followers?per_page={PageSize}&page={PageNumber}"
    public static var following : String = "https://api.github.com/users/{User}/following?per_page={PageSize}&page={PageNumber}"
}
