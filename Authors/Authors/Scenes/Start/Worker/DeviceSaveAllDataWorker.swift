//
//  DeviceSaveAllDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

class DeviceSaveAllDataWorker: DeviceSaveAllDataWorkerDelegate {
    func createAllData(posts: [Post], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let saveAllService = DeviceSaveAllDataService()

        saveAllService.createAllData(posts: posts) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
