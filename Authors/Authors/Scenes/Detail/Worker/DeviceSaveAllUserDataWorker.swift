//
//  DeviceSaveAllUserDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceSaveAllUserDataWorker: DeviceSaveAllUserDataWorkerDelegate {
    func createData(users: [User], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let saveService = DeviceSaveAllUserDataService()

        saveService.createAllData(users: users) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
