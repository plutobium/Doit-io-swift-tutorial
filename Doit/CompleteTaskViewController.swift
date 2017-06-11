//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by vux on 11/6/17.
//  Copyright © 2017 crypticmantra. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var previousViewController:TasksViewController! // or ()
    var task : CoredataTask? = nil
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBAction func removeButtonAction(_ sender: Any) {
        //previousViewController.tasks.remove(at:previousViewController.selectedIndex);
        //previousViewController.tasksTableView.reloadData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameLabel.text = task?.name!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
