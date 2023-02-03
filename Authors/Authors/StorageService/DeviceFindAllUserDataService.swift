//
//  DeviceFindAllUserDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 03/02/23.
//

import CoreData
import UIKit

protocol DeviceFindAllUserDataServiceProtocol {
    func findAllUserData(success: @escaping ([User]) -> (), fail: @escaping (String) -> ())
}

class DeviceFindAllUserDataService: DeviceFindAllUserDataServiceProtocol {
    
    func findAllUserData(success: @escaping ([User]) -> (), fail: @escaping (String) -> ()) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BackupUser")
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                
                let backupUsers = try managedContext.fetch(fetchRequest) as? [BackupUser]
                
                var users: [User] = []
                
                for backupUser in backupUsers ?? [] {
                    let user: User = User(id: backupUser.id, name: backupUser.name ?? "", username: backupUser.username ?? "", email: backupUser.email ?? "", address: Address(street: backupUser.address?.street, suite: backupUser.address?.suite, city: backupUser.address?.city, zipcode: backupUser.address?.zipcode, geo: Geo(lat: backupUser.address?.geo?.lat, lng: backupUser.address?.geo?.lng)), phone: backupUser.phone ?? "", website: backupUser.website ?? "", company: Company(name: backupUser.company?.name, catchPhrase: backupUser.company?.catchPhrase, bs: backupUser.company?.bs))
                    users.append(user)
                }
                
                success(users)
            }
            catch {
                print(error)
                fail("failed to persist deletion")
            }
        }
    }
}
