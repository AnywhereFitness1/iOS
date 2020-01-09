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
    
    //MARK: - Outlets
    @IBOutlet weak var classesTableView: UITableView!
    @IBOutlet weak var classesNavigationBar: UINavigationBar!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Methods
    
    //MARK: - Actions
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}

extension InstructorClassesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkController?.classes.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)
        
        let singleClass = networkController?.classes[indexPath.row]
        cell.textLabel?.text = singleClass?.name
        cell.detailTextLabel?.text = singleClass?.Location
        
        return cell
    }
    
}
