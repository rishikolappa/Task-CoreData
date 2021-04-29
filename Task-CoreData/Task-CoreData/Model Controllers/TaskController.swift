//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Rishi Kolappa on 4/27/21.
//

import CoreData

class TaskController {
    
    //MARK: - Properties
    static let sharedInstance = TaskController()
    // Source of Truth: where data I want to display is stored
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
        
    }()
    
    // private init() {}
    
    //MARK: - Functions
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        // Ask Kelsey why we dont have to append to our source of truth
        // let task =
        Task(name: name, notes: notes, dueDate: dueDate)
        
        CoreDataStack.saveContext()
        
    }
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        
        self.tasks = tasks
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        
        task.isComplete.toggle()
        CoreDataStack.saveContext()

    }
}
