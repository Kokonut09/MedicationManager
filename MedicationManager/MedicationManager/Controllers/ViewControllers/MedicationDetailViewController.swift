//
//  MedicationDetailViewController.swift
//  MedicationManager
//
//  Created by Andrew Saeyang on 7/26/21.
//

import UIKit

class MedicationDetailViewController: UIViewController {

    // MARK: - OUTLETS
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - PROPERTIES
    var medication: Medication?
    
    // MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - ACTIONS
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        
        if let medication = medication {
            MedicationController.shared.updateMedication(medication: medication, name: name, date: datePicker.date)
        } else {
            MedicationController.shared.createMedication(name: name, timeOfDay: datePicker.date)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - HELPER METHODS

    func updateViews(){
        guard let medication = medication else { return }
        nameTextField.text = medication.name
        datePicker.date = medication.timeOfDay ?? Date()
    }
    
} // End of class
