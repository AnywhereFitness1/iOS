//
//  ClientSearchDetailViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/9/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class ClientSearchDetailViewController: UIViewController {

    //MARK: - Properties
    
    var singleClass: Class?
    
    //MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var intensityTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var currentAthletesTextField: UITextField!
    @IBOutlet weak var maxAthletesTextField: UITextField!
    @IBOutlet weak var searchDetailNavBar: UINavigationBar!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    //MARK: - Methods
    
    func updateViews() {
        guard let singleClass = singleClass else { return }
        
        searchDetailNavBar.topItem?.title = singleClass.name
        
        nameTextField.text = singleClass.name
        typeTextField.text = singleClass.type
        startTimeTextField.text = String(describing: singleClass.Start)
        durationTextField.text = singleClass.Duration
        intensityTextField.text = singleClass.Intensity
        locationTextField.text = singleClass.Location
        currentAthletesTextField.text = String(describing: singleClass.AthleteCount)
        maxAthletesTextField.text = String(describing: singleClass.MaxAthleteCount)
    }
    
    //MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    @IBAction func joinClassButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
}
