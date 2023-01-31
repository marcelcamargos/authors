//
//  DeviceUpdateDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import UIKit
import CoreData

protocol DeviceUpdateDataServiceDatasource {
    func updateData(post: Post, favourite: Bool, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}

class DeviceUpdateDataService: DeviceUpdateDataServiceDatasource {
    func updateData(post: Post, favourite: Bool, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Wishes")
        fetchRequest.predicate = NSPredicate(format: "id == %d", post.id)
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            if let objectUpdate = test[0] as? NSManagedObject {
                objectUpdate.setValue(favourite, forKey: "favourite")
                do {
                    try managedContext.save()
                    success(favourite)
                }
                catch
                {
                    print(error)
                    fail("update failed")
                }
            }
        }
        catch
        {
            print(error)
            fail("update failed")
        }
    }
}
