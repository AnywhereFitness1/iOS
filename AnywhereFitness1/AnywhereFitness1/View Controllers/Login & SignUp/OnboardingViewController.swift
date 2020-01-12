//
//  OnboardingViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    //MARK: - Properties
    
    var client: Bool = false
    
    //MARK: - Outlets
    
    @IBOutlet weak var clientOnboardingTextView: UITextView!
    @IBOutlet weak var instructorOnboardingTextView: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpSubviews()
        if client == true {
            clientOnboardingTextView.alpha = 1
            instructorOnboardingTextView.alpha = 0
        } else {
            clientOnboardingTextView.alpha = 0
            instructorOnboardingTextView.alpha = 1
        }
    }
    
    //MARK: - Actions
    @IBAction func skipButtonTapped(_ sender: Any) {
        if instructorOnboardingTextView.alpha == 1 {
            performSegue(withIdentifier: "instructorMainSegue", sender: self)
        } else if clientOnboardingTextView.alpha == 1 {
            performSegue(withIdentifier: "clientMainSegue", sender: self)
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        if instructorOnboardingTextView.alpha == 1 {
            performSegue(withIdentifier: "instructorMainSegue", sender: self)
        } else if clientOnboardingTextView.alpha == 1 {
            performSegue(withIdentifier: "clientMainSegue", sender: self)
        }
    }
    
    //MARK: - Methods
    
    func setUpSubviews() {
        clientOnboardingTextView.layer.borderColor = UIColor.white.cgColor
        clientOnboardingTextView.layer.borderWidth = 3.0
        clientOnboardingTextView.layer.cornerRadius = 10.0
        
        instructorOnboardingTextView.layer.borderColor = UIColor.white.cgColor
        instructorOnboardingTextView.layer.borderWidth = 3.0
        instructorOnboardingTextView.layer.cornerRadius = 10.0
        
        skipButton.layer.borderColor = UIColor.white.cgColor
        skipButton.layer.borderWidth = 1.5
        skipButton.layer.cornerRadius = 10.0
        
        continueButton.layer.borderColor = UIColor.white.cgColor
        continueButton.layer.borderWidth = 1.5
        continueButton.layer.cornerRadius = 10.0
    }
}
