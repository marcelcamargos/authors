//
//  DeviceSaveDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import UIKit
import CoreData

protocol DeviceSaveDataServiceDatasource: AnyObject {
    func createData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}

class DeviceSaveDataService: DeviceSaveDataServiceDatasource {
    func createData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let favouriteEntity = NSEntityDescription.entity(forEntityName: "Wishes", in: managedContext) else { return }
        do {
            let user = NSManagedObject(entity: favouriteEntity, insertInto: managedContext)
            user.setValue(post.body, forKeyPath: "body")
            user.setValue(post.id, forKey: "id")
            user.setValue(post.title, forKey: "title")
            user.setValue(post.userId, forKey: "userId")
            try managedContext.save()
            success(true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            fail("saving failed")
        }
    }
}
