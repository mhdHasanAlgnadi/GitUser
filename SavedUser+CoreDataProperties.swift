//
//  SavedUser+CoreDataProperties.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 18/08/2022.
//
//

import Foundation
import CoreData


extension SavedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedUser> {
        return NSFetchRequest<SavedUser>(entityName: "SavedUser")
    }

    @NSManaged public var avatarURL: URL?
    @NSManaged public var bio: String?
    @NSManaged public var creationDate: String?
    @NSManaged public var followers: Int32
    @NSManaged public var following: Int32
    @NSManaged public var id: Int32
    @NSManaged public var location: String?
    @NSManaged public var login: String?
    @NSManaged public var name: String?

}

extension SavedUser : Identifiable {

}
