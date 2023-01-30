//
//  DeviceSaveDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

import UIKit
import CoreData

protocol DeviceSaveDataServiceDatasource: AnyObject {
    func createData(post: Post, favourite: Bool, success: @escaping (String) -> (), fail: @escaping (String) -> ())
}

class DeviceSaveDataService: DeviceSaveDataServiceDatasource {
    func createData(post: Post, favourite: Bool, success: @escaping (String) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let favouriteEntity = NSEntityDescription.entity(forEntityName: "Favourite", in: managedContext) else { return }
        do {
            let user = NSManagedObject(entity: favouriteEntity, insertInto: managedContext)
            user.setValue(post.body, forKeyPath: "body")
            user.setValue(favourite, forKey: "favourite")
            user.setValue(post.id, forKey: "id")
            user.setValue(post.title, forKey: "title")
            user.setValue(post.userId, forKey: "userId")
            try managedContext.save()
            success("saved")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            fail("saving failed")
        }
    }
}
