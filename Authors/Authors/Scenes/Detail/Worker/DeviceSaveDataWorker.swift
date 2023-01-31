//
//  DeviceSavingData.swift
//  Authors
//
//  Created by Marcel Camargos on 30/01/23.
//

class DeviceSaveDataWorker: DeviceSaveDataWorkerDelegate {
    func createData(post: Post, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let saveService = DeviceSaveDataService()

        saveService.createData(post: post) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
