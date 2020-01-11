//
//  LoginViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

enum Department: String {
    case client = "Client"
    case instructor = "Instructor"
}

class LoginViewController: UIViewController {

    //MARK: - Properties
    let networkController = NetworkController()
    
    //MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Methods
    
    //MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else { return }
        
        if segmentedControl.selectedSegmentIndex == 0 {
            networkController.login(department: Department.client.rawValue, username: username, password: password) { (error) in
                if let error = error {
                    print("Error logging in: \(error)")
                    DispatchQueue.main.async {
                        self.usernameTextField.text = ""
                        self.passwordTextField.text = ""
                    }
                } else {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "clientSegue", sender: self)
                    }
                }
            }
        } else if segmentedControl.selectedSegmentIndex == 1 {
            networkController.login(department: Department.instructor.rawValue, username: username, password: password) { (error) in
                if let error = error {
                    print("Error logging in: \(error)")
                    DispatchQueue.main.async {
                        self.usernameTextField.text = ""
                        self.passwordTextField.text = ""
                    }
                } else {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "instructorSegue", sender: self)
                    }
                }
            }
        }
    }
    
}
