//
//  TableViewController.swift
//  ToDoList_CoreData
//
//  Created by Evgeniy Nosko on 10.09.21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func plusTasks(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "New tasks", message: "Add tasks", preferredStyle: .alert)
        
        let saveTask = UIAlertAction(title: "Save", style: .default) { action in
            let textField = alertController.textFields?.first
            if let newTask = textField?.text {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextField { _ in }
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .default) { _ in }
        
        alertController.addAction(saveTask)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }

}
