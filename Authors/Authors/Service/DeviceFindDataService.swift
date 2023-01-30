//
//  DeviceFindDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import UIKit
import CoreData

protocol DeviceFindDataServiceDatasource {
    func findByPost(post: Post) -> Bool
}

class DeviceFindDataService: DeviceFindDataServiceDatasource {
    func findByPost(post: Post) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "id == %d", post.id)
        
        do {
            let count = try managedContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
}
