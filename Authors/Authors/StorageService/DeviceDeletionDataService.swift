//
//  DeviceDeletionDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import CoreData
import UIKit

protocol DeviceDeletionDataServiceProtocol {
    func deleteData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}

class DeviceDeletionDataService: DeviceDeletionDataServiceProtocol {
    
    func deleteData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Wishes")
        fetchRequest.predicate = NSPredicate(format: "id = %d", post.id)
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            if test.isEmpty { return }
            
            if let test = test[0] as? NSManagedObject {
                let objectToDelete = test
                managedContext.delete(objectToDelete)
                do {
                    try managedContext.save()
                    success(true)
                }
                catch {
                    print(error)
                    fail("failed to delete")
                }
            }
        }
        catch {
            print(error)
            fail("failed to delete")
        }
    }
}
