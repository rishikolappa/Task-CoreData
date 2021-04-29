//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Rishi Kolappa on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

    // OUTLETS
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var completionButton: UIButton!
    
    //Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    weak var delegate: TaskCompletionDelegate?

//ACTION

    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    //Functions
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(named:"complete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
    
} //End of class
