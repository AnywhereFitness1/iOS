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
    
    let networkController = NetworkController()
    let instructorClassController = InstructorClassesViewController()
    var singleClass: Class?
    
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
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
            durationTextField.text = singleClass.Duration
            intensityTextField.text = singleClass.Intensity
            locationTextField.text = singleClass.Location
            currentAthletesTextField.text = String(describing: singleClass.AthleteCount)
            maxAthletesTextField.text = String(describing: singleClass.MaxAthleteCount)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let id = singleClass?.id, let name = nameTextField.text, let type = typeTextField.text, let duration = durationTextField.text, let intensity = intensityTextField.text, let location = locationTextField.text, let currentAthletes = Int(currentAthletesTextField.text ?? ""), let maxAthletes = Int(maxAthletesTextField.text ?? "") else { return }
        
        if singleClass == nil {
            let classy = Class(id: nil, name: name, type: type, Duration: duration, Intensity: intensity, Location: location, AthleteCount: currentAthletes, MaxAthleteCount: maxAthletes)
            instructorClassController.instructorClasses.append(classy)
            networkController.createClass(for: classy) { (error) in
                if let error = error {
                    print("Error updating class: \(error)")
                }
            }
        } else {
            let classy = Class(id: id, name: name, type: type, Duration: duration, Intensity: intensity, Location: location, AthleteCount: currentAthletes, MaxAthleteCount: maxAthletes)
            networkController.updateClass(for: classy) { (error) in
                if let error = error {
                    print("Error updating class: \(error)")
                }
            }
        }
    }
    

    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
