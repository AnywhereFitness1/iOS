//
//  InstructorPunchDetailViewController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/11/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class InstructorPunchDetailViewController: UIViewController {

    //MARK: - Properties
    
    var pass: Pass?
    let instructorPunchController = InstructorPunchViewController()
    
    //MARK: - Outlets
    
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var passNavBar: UINavigationBar!
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
    }
    
    //MARK: - Methods
    
    func setUpSubviews() {
        passView.layer.borderColor = UIColor.black.cgColor
        passView.layer.borderWidth = 3.0
        passView.layer.cornerRadius = 10.0
        
        if pass == nil {
            passNavBar.topItem?.title = "Create Pass"
        } else {
            passNavBar.topItem?.title = String(describing: pass?.name)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty, let type = typeTextField.text, !type.isEmpty else { return }
        
        let passy = Pass(name: name, type: type)
        instructorPunchController.passes.append(passy)
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "backSegue", sender: self)
        }
    }

}
