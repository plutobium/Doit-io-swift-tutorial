//
//  AddViewController.swift
//  Doit
//
//  Created by vux on 11/6/17.
//  Copyright © 2017 crypticmantra. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskImportantSwitch: UISwitch!
    
    var previousViewController = TasksViewController()
    
    @IBAction func saveTaskButtonAction(_ sender: Any) {
        
        // CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let coredataTask = CoredataTask(context:context)
        
        // create new Task object
        //let task = Task() without coredata
        coredataTask.name = taskNameTextField.text!
        coredataTask.important = taskImportantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // update previous data
        //previousViewController.tasks.append(coredataTask)
        //previousViewController.tasksTableView.reloadData()
        
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
