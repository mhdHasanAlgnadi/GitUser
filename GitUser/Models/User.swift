//
//  User.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import UIKit

struct User : Codable{
    var login: String?
    var id: Int?
    var name: String?
    var avatarURL: String?
    var followers: Int?
    var following: Int?
    var location: String?
    var bio: String?
    var created_at: String?
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case name
        case avatarURL = "avatar_url"
        case followers
        case following
        case bio
        case created_at
        case location
    }
}

typealias Users = [User]
