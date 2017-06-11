//
//  TasksViewController.swift
//  Doit
//
//  Created by vux on 9/6/17.
//  Copyright © 2017 crypticmantra. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = UITableViewCell()
        if(task.important) {
            cell.textLabel?.text = "! \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Preparing for Segue: " + segue.identifier!)
        
        if segue.identifier == "detailSegue"  {
            let addVC = segue.destination as! AddViewController
            addVC.previousViewController = self
        }
        
        if segue.identifier == "selectTaskSegue" {
            let completeVC = segue.destination as! CompleteTaskViewController
            completeVC.previousViewController = self
            completeVC.task = sender as! Task
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        print("Index is: \(selectedIndex)")
        performSegue(withIdentifier: "selectTaskSegue", sender: tasks[selectedIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // --------------------------------
        tasks = makeTasks()
        tasksTableView.dataSource = self
        tasksTableView.delegate   = self
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.important = true;
        task1.name = "Walk the dog"
        let task2 = Task()
        task2.important = true;
        task2.name = "Buy Cheese"
        let task3 = Task()
        task3.important = false;
        task3.name = "mow lawn"
        return [task1,task2,task3]
    }
}

