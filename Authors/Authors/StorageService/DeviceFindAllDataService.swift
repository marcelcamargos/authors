//
//  DeviceFindAllDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 31/01/23.
//

import UIKit
import CoreData

protocol DeviceFindAllDataServiceDatasource {
    func findFavourites(entityName: String, success: @escaping ([Post]) -> (), fail: @escaping (String) -> ())
}

class DeviceFindAllDataService: DeviceFindAllDataServiceDatasource {
    func findFavourites(entityName: String, success: @escaping ([Post]) -> (), fail: @escaping (String) -> ()) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            do {
                let result = try managedContext.fetch(fetchRequest)
                var posts: [Post] = []
                if let result = result as? [NSManagedObject] {
                    for data in result {
                        let id = data.value(forKey: "id") as? Int ?? -1
                        let userId = data.value(forKey: "userId") as? Int ?? -1
                        let title = data.value(forKey: "title") as? String ?? ""
                        let body = data.value(forKey: "body") as? String ?? ""
                        let post = Post(userId: userId, id: id, title: title, body: body)
                        posts.append(post)
                    }
                    success(posts)
                }
            } catch {
                print("Failed")
            }
        }
    }
}
