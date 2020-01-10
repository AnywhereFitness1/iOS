//
//  ClientClassDetailViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/9/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class ClientClassDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    let clientClassController = ClientClassViewController()
    let networkController = NetworkController()
    var position: Int?
    var singleClass: Class?
    
    //MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var intensityTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var currentAthletesTextField: UITextField!
    @IBOutlet weak var maxAthletesTextField: UITextField!
    
    //MARK: - Views

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

    //MARK: - Methods
    
    private func updateViews() {
        guard let singleClass = singleClass else { return }
        
        nameTextField.text = singleClass.name
        typeTextField.text = singleClass.type
        durationTextField.text = singleClass.Duration
        intensityTextField.text = singleClass.Intensity
        locationTextField.text = singleClass.Location
        currentAthletesTextField.text = String(describing: singleClass.AthleteCount)
        maxAthletesTextField.text = String(describing: singleClass.MaxAthleteCount)
    }
    
    //MARK: - Actions
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        guard let classy = singleClass, let position = position else { return }
        
        let count = classy.AthleteCount - 1
        let updatedClass = Class(id: classy.id, name: classy.name, type: classy.type, Duration: classy.Duration, Intensity: classy.Intensity, Location: classy.Location, AthleteCount: count, MaxAthleteCount: classy.MaxAthleteCount)
        networkController.updateClass(for: updatedClass) { (error) in
            if let error = error {
                print("Error updating class number: \(error)")
            }
        }
        clientClassController.clientClasses.remove(at: position)
    }
    
}
