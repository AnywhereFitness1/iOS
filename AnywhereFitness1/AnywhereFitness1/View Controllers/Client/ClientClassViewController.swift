//
//  ClientClassViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/9/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class ClientClassViewController: UIViewController {

    //MARK: - Properties
    private var classes: [Class] = []
    
    //MARK: - Outlets
    
    @IBOutlet weak var classesNavBar: UINavigationBar!
    @IBOutlet weak var classesTableView: UITableView!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classesNavBar.topItem?.title = "Classes"
    }
    
    //MARK: - Methods
    
    //MARK: - Actions
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClientClassSegue" {
            guard let detailVC = segue.destination as? ClientClassDetailViewController, let indexPath = classesTableView.indexPathForSelectedRow else { return }
            let singleClass = classes[indexPath.row]
            detailVC.singleClass = singleClass
        }
    }

}

extension ClientClassViewController: UITableViewDataSource {
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
