//
//  MedicationTableViewCell.swift
//  MedicationManager
//
//  Created by Andrew Saeyang on 7/26/21.
//

import UIKit

class MedicationTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dosageTimeLabel: UILabel!
    @IBOutlet weak var hasTakenButton: UIButton!
    
    // MARK: - PROPERTIES
    
    
    // MARK: - ACTIONS
    @IBAction func hasBeenTakenButtonTapped(_ sender: Any) {
        print("med has been taken.")
        
    }
    
    
    // MARK: - HELPER METHODS
    func configure(with medication: Medication) {
        titleLabel.text = medication.name
        dosageTimeLabel.text = medication.timeOfDay?.dateAsString()
    }
    
}
