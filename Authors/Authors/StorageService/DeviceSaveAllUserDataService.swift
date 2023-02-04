//
//  DeviceSaveAllUserDataService.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import UIKit
import CoreData

class DeviceSaveAllUserDataService: DeviceSaveAllUserDataServiceDatasource {
    func createAllData(users: [User], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        for user in users {
            let backupUser = BackupUser(context: managedContext)
            backupUser.id = user.id ?? -1
            backupUser.name = user.name
            backupUser.username = user.username
            backupUser.email = user.email
            backupUser.phone = user.phone
            backupUser.website = user.website
            
            let backupAddress = BackupAddress(context : managedContext)
            backupAddress.street = user.address?.street
            backupAddress.suite = user.address?.suite
            backupAddress.city = user.address?.city
            backupAddress.zipcode = user.address?.zipcode
            
            backupUser.address = backupAddress
            
            let backupGeo = BackupGeo(context: managedContext)
            backupGeo.lat = user.address?.geo?.lat
            backupGeo.lng = user.address?.geo?.lng
            
            backupAddress.geo = backupGeo
            
            let backupCompany = BackupCompany(context: managedContext)
            backupCompany.name = user.company?.name
            backupCompany.catchPhrase = user.company?.catchPhrase
            backupCompany.bs = user.company?.bs
            
            backupUser.company = backupCompany
            
            appDelegate.saveContext()
        }
        success(true)
    }
}
