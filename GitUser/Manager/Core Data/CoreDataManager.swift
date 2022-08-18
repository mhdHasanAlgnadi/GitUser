//
//  CoreDataManager.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 18/08/2022.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager(modelName: "GitUser")
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                return
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch  {
                print("error")
            }
        }
    }
}


//MARK: - Helper functions

extension CoreDataManager {
    func create(_ user: User){
        let savedUser = SavedUser(context: viewContext)
        savedUser.following = Int32(user.following ?? 0)
        savedUser.followers = Int32(user.followers ?? 0)
        savedUser.avatarURL = URL.init(string: user.avatarURL ?? "")
        savedUser.login = user.login
        savedUser.location = user.location
        savedUser.creationDate = user.created_at
        savedUser.id = Int32(user.id ?? 0)
        savedUser.bio = user.bio
        savedUser.name = user.name
        save()
    }
    
    func fetchUser() -> [SavedUser] {
        let request : NSFetchRequest<SavedUser> = SavedUser.fetchRequest()
        return (try? viewContext.fetch(request)) ?? []
    }
    
    func parseModel(_ savedUser: SavedUser) -> User {
        return User(login: savedUser.login,
                    id: Int(savedUser.id),
                    name: savedUser.name,
                    avatarURL: "\(savedUser.avatarURL ?? URL(fileURLWithPath: ""))",
                    followers: Int(savedUser.followers),
                    following: Int(savedUser.following),
                    location: savedUser.location,
                    bio: savedUser.bio,
                    created_at: savedUser.creationDate)
    }
}
