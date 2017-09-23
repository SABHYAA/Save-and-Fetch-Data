//
//  Users+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by appinventiv on 23/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var secondname: String?

}
