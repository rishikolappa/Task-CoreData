//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Rishi Kolappa on 4/27/21.
//

import CoreData

extension Task {

    @discardableResult convenience init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.dueDate = dueDate
        self.notes = notes
        self.name = name
        self.isComplete = isComplete
    }
}


