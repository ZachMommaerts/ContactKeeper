//
//  Contact+CoreDataProperties.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 12/5/23.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension Contact : Identifiable {

}
