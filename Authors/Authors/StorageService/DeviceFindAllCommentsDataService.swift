//
//  DeviceFindAllCommentsDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import UIKit
import CoreData

protocol DeviceFindAllCommentsDataServiceDatasource {
    func findAllComments(post: Post, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ())
}

class DeviceFindAllCommentsDataService: DeviceFindAllCommentsDataServiceDatasource {
    func findAllComments(post: Post, success: @escaping ([Comment]) -> (), fail: @escaping (String) -> ()) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BackupComments")
            fetchRequest.predicate = NSPredicate(format: "postId == %d", post.id)
            do {
                let result = try managedContext.fetch(fetchRequest)
                var comments: [Comment] = []
                if let result = result as? [NSManagedObject] {
                    for data in result {
                        let postId = data.value(forKey: "postId") as? Int32 ?? -1
                        let id = data.value(forKey: "id") as? Int32 ?? -1
                        let name = data.value(forKey: "name") as? String ?? ""
                        let email = data.value(forKey: "email") as? String ?? ""
                        let body = data.value(forKey: "body") as? String ?? ""
                        let comment = Comment(postId: postId, id: id, name: name, email: email, body: body)
                        comments.append(comment)
                    }
                    success(comments)
                }
            } catch {
                print("Failed")
            }
        }
    }
}
