//
//  DeviceSaveAllCommentsDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import UIKit
import CoreData

class DeviceSaveAllCommentsDataService: DeviceSaveAllCommentsDataServiceDatasource {
    func createAllData(comments: [Comment], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        for comment in comments {
            let backupPost = NSEntityDescription.insertNewObject(forEntityName: "BackupComments", into: managedContext)
            backupPost.setValue(comment.postId, forKeyPath: "postId")
            backupPost.setValue(comment.id, forKey: "id")
            backupPost.setValue(comment.name, forKey: "name")
            backupPost.setValue(comment.email, forKey: "email")
            backupPost.setValue(comment.body, forKey: "body")
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
