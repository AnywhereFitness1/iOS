//
//  InstructorClassDetailViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/9/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class InstructorClassDetailViewController: UIViewController {

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
    @IBOutlet weak var classNavigationBar: UINavigationBar!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    //MARK: - Methods
    
    func updateViews() {
        if singleClass == nil {
            classNavigationBar.topItem?.title = "New Class"
            nameTextField.text = ""
            typeTextField.text = ""
            startTimeTextField.text = ""
            durationTextField.text = ""
            intensityTextField.text = ""
            locationTextField.text = ""
            currentAthletesTextField.text = ""
            maxAthletesTextField.text = ""
        } else {
            guard let singleClass = singleClass else { return }
            
            classNavigationBar.topItem?.title = singleClass.name
            nameTextField.text = singleClass.name
            typeTextField.text = singleClass.type
            startTimeTextField.text = String(describing: singleClass.Start)
            durationTextField.text = singleClass.Duration
            intensityTextField.text = singleClass.Intensity
            locationTextField.text = singleClass.Location
            currentAthletesTextField.text = String(describing: singleClass.AthleteCount)
            maxAthletesTextField.text = String(describing: singleClass.MaxAthleteCount)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
