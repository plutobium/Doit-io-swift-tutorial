//
//  AddViewController.swift
//  Doit
//
//  Created by vux on 11/6/17.
//  Copyright © 2017 crypticmantra. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskImportantSwitch: UISwitch!
    
    var previousViewController = TasksViewController()
    
    @IBAction func saveTaskButtonAction(_ sender: Any) {
        
        // create new Task object
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = taskImportantSwitch.isOn
        
        // update previous data
        previousViewController.tasks.append(task)
        previousViewController.tasksTableView.reloadData()
        
        // move back
        navigationController!.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
