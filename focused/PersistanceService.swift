//
//  PersistanceService.swift
//  focused
//
//  Created by Jose Veliz on 7/4/19.
//  Copyright © 2019 Jose Veliz. All rights reserved.
//

import Foundation
import CoreData

class PersistanceService {
    
    private init(){}
    
    static var context:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    //Container
    static var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "focused")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //Save
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
