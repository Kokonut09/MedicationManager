//
//  MedicationListViewController.swift
//  MedicationManager
//
//  Created by Andrew Saeyang on 7/26/21.
//

import UIKit

class MedicationListViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        //MedicationController.shared.fetchMedications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        // Identifier
        if segue.identifier == "toEditMedication"{
            // Index Path
            // Destination
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? MedicationDetailViewController else { return }
            
            // Object to send
            let medication = MedicationController.shared.medications[indexPath.row]
            
            
            // Object to Recieve
            destination.medication = medication
            
        }
        
    }
    
}

extension MedicationListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MedicationController.shared.medications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medicationCell", for: indexPath) as? MedicationTableViewCell else {return UITableViewCell()}
        
        let medication = MedicationController.shared.medications[indexPath.row]
        
        cell.configure(with: medication)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
