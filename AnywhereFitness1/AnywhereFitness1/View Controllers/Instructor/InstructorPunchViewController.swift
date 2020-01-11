//
//  InstructorPunchViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class InstructorPunchViewController: UIViewController {

    //MARK: - Properties
    
    var passes: [Pass] = []
    
    //MARK: - Outlets
    
    @IBOutlet weak var punchPassTableView: UITableView!
    @IBOutlet weak var punchNavBar: UINavigationBar!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        punchNavBar.topItem?.title = "Punch Passes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        punchPassTableView.reloadData()
    }

    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "punchSegue" {
            guard let detailVC = segue.destination as? InstructorPunchDetailViewController, let indexPath = punchPassTableView.indexPathForSelectedRow else { return }
            detailVC.pass = passes[indexPath.row]
        }
    }
}

extension InstructorPunchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = punchPassTableView.dequeueReusableCell(withIdentifier: "PunchCell", for: indexPath)
        
        let pass = passes[indexPath.row]
        cell.textLabel?.text = pass.name
        
        return cell
    }
    
    
}
