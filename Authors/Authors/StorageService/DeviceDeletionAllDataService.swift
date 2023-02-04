//
//  DeviceDeletionAllDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import CoreData
import UIKit

class DeviceDeletionAllDataService: DeviceDeletionAllDataServiceProtocol {
    
    func deleteAllData(entityName: String, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else { continue }
                managedContext.delete(objectData)
            }
            do {
                try managedContext.save()
                success(true)
            }
            catch {
                print(error)
                fail("failed to delete all")
            }
        } catch let error {
            print("Detele all data in error :", error)
        }
    }
}
