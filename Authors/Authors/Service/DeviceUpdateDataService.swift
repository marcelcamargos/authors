//
//  DeviceUpdateDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import UIKit
import CoreData

protocol DeviceUpdateDataServiceDatasource {
    func updateData(post: Post, favourite: Bool) -> Bool
}

class DeviceUpdateDataService: DeviceUpdateDataServiceDatasource {
    func updateData(post: Post, favourite: Bool) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Favourite")
        fetchRequest.predicate = NSPredicate(format: "id = %@", post.id)
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            if let objectUpdate = test[0] as? NSManagedObject {
                objectUpdate.setValue(favourite, forKey: "favourite")
                do {
                    try managedContext.save()
                    return true
                }
                catch
                {
                    print(error)
                }
            }
        }
        catch
        {
            print(error)
        }
        return false
    }
}
