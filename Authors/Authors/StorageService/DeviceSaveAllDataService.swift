//
//  DeviceSaveAllDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import UIKit
import CoreData

protocol DeviceSaveAllDataServiceDatasource: AnyObject {
    func createAllData(posts: [Post], success: @escaping (Bool) -> (), fail: @escaping (String) -> ())
}

class DeviceSaveAllDataService: DeviceSaveAllDataServiceDatasource {
    func createAllData(posts: [Post], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        for post in posts {
            let backupPost = NSEntityDescription.insertNewObject(forEntityName: "BackupPosts", into: managedContext)
            backupPost.setValue(post.body, forKeyPath: "body")
            backupPost.setValue(post.id, forKey: "id")
            backupPost.setValue(post.title, forKey: "title")
            backupPost.setValue(post.userId, forKey: "userId")
        }
        do {
            try managedContext.save()
            success(true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            fail("saving failed")
        }
    }
}
