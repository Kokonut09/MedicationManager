//
//  Medication+Convenience.swift
//  MedicationManager
//
//  Created by Andrew Saeyang on 7/26/21.
//

import CoreData

extension Medication {
    
    @discardableResult
    //new way to initalize
    convenience init (name: String, timeOfDay: Date, context: NSManagedObjectContext = CoreDataStack.context){
        
        self.init(context: context)
        self.name = name
        self.timeOfDay = timeOfDay
    }
    
} //End of extension

