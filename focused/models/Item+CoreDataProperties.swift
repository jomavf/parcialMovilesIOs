//
//  Item+CoreDataProperties.swift
//  focused
//
//  Created by Jose Veliz on 7/4/19.
//  Copyright © 2019 Jose Veliz. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var descripcion: String?
    @NSManaged public var priority: Int16
    @NSManaged public var urlimage: String?
    @NSManaged public var createdat: NSDate?
    @NSManaged public var doneat: NSDate?

}
