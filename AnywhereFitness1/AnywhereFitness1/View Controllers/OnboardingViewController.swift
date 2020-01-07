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
    
    //MARK: - Outlets
    
    @IBOutlet weak var onboardingTextView1: UITextView!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func skipButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "mainSegue", sender: self)
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: - Methods
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
