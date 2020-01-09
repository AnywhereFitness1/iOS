//
//  InstructorClassesViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class InstructorClassesViewController: UIViewController {

    //MARK: - Properties
    var networkController: NetworkController?
    private var classes: [Class] = []
    
    //MARK: - Outlets
    @IBOutlet weak var classesTableView: UITableView!
    @IBOutlet weak var classesNavigationBar: UINavigationBar!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classesNavigationBar.topItem?.title = "Classes"
    }
    
    //MARK: - Methods
    
    //MARK: - Actions
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClassDetailSegue" {
            guard let detailVC = segue.destination as? InstructorClassDetailViewController, let indexPath = classesTableView.indexPathForSelectedRow else { return }
            let singleClass = classes[indexPath.row]
            detailVC.singleClass = singleClass
        }
    }

}

extension InstructorClassesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)
        
        let singleClass = classes[indexPath.row]
        cell.textLabel?.text = singleClass.name
        cell.detailTextLabel?.text = singleClass.Location
        
        return cell
    }
    
}
