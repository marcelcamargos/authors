//
//  DeviceDeletionAllCompanyDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import CoreData
import UIKit

protocol DeviceDeletionAllCompanyDataServiceProtocol {
    func deleteAllCompanyData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}

class DeviceDeletionAllCompanyDataService: DeviceDeletionAllCompanyDataServiceProtocol {
    
    func deleteAllCompanyData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BackupCompany")
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
                fail("failed to persist deletion")
            }
        } catch let error {
            print("Detele all data in error :", error)
        }
    }
}