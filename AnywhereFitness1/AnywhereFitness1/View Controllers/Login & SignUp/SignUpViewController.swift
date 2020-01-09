//
//  SignUpViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - Properties
    
    let networkController = NetworkController()
    
    //MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else { return }
        
        if segmentedControl.selectedSegmentIndex == 0 {
            networkController.register(department: Department.client.rawValue, username: username, password: password)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "onboardingSegue", sender: self)
            }
        } else if segmentedControl.selectedSegmentIndex == 1 {
            networkController.register(department: Department.instructor.rawValue, username: username, password: password)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "onboardingSegue", sender: self)
            }
        }
    }
    
    //MARK: - Methods
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segmentedControl.selectedSegmentIndex == 0 {
            if segue.identifier == "onboardingSegue" {
                guard let onboardVC = segue.destination as? OnboardingViewController else { return }
                onboardVC.client = true
            }
        } else if segmentedControl.selectedSegmentIndex == 1 {
            if segue.identifier == "onboardingSegue" {
                guard let onboardVC = segue.destination as? OnboardingViewController else { return }
                onboardVC.client = false
            }
        }
    }

}
