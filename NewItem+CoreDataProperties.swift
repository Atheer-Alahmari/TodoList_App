//
//  NewItem+CoreDataProperties.swift
//  TodoList_App
//
//  Created by Atheer Alahmari on 14/05/1443 AH.
//
//

import Foundation
import CoreData


extension New_Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<New_Item> {
        return NSFetchRequest<New_Item>(entityName: "New_Item")
    }

    @NSManaged public var titel: String?
    @NSManaged public var note: String?
    @NSManaged public var dueDate: String?
    @NSManaged public var checkMark: Bool

}

extension New_Item : Identifiable {

}
