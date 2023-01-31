//
//  DeviceFindDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import UIKit
import CoreData

protocol DeviceFindDataServiceDatasource {
    func findByPost(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
    func findByPost(post: Post) -> Bool
}

class DeviceFindDataService: DeviceFindDataServiceDatasource {
    func findByPost(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "id == %d", post.id)
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            for result in objects {
                let favourite = result.value(forKey: "favourite") as? Bool ?? false
                success(favourite)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            fail("fail")
        }
    }
    
    func findByPost(post: Post) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "id == %d", post.id)
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            if objects.count > 0 {
                return true
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return false
    }
}
