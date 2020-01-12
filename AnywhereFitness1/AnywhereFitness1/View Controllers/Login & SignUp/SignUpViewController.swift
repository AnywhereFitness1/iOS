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
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
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
    
    private func setUpSubviews() {
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        registerButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.borderWidth = 1.5
        registerButton.layer.cornerRadius = 10.0
        
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 1.5
        loginButton.layer.cornerRadius = 10.0
        
    }
    

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
