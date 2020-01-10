//
//  ClientSearchViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/9/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class ClientSearchViewController: UIViewController {

    //MARK: - Properties
    
    let networkController = NetworkController()
    var classes: [Class] = []
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchClassesTableView: UITableView!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Methods
    
    //MARK: - Actions
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            guard let detailVC = segue.destination as? ClientSearchDetailViewController, let indexPath = searchClassesTableView.indexPathForSelectedRow else { return }
            let singleClass = classes[indexPath.row]
            detailVC.singleClass = singleClass
        }
    }
}

extension ClientSearchViewController: UITableViewDataSource {
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

extension ClientSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let name = searchBar.text else { return }

        networkController.searchForClasses(with: name) { (result) in
            DispatchQueue.main.async {
                do {
                    let result = try result.get()
                    self.classes = result
                    self.searchClassesTableView.reloadData()
                } catch {
                    print("Error getting search result: \(error)")
                }
            }
        }
    }
}
