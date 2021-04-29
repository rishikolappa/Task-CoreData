//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Rishi Kolappa on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: OUTLETS
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //Properties

    var task: Task?
    var date: Date?
    
    //Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    //MARK: ACTIONS
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty
        else {return}
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: taskNotesTextView.text, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: taskNotesTextView.text, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        self.date = taskDueDatePicker.date
    }
    
    //MARK - Functions
    
    func updateViews() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
}
