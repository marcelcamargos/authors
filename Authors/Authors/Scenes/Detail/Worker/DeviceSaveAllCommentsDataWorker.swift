//
//  DeviceSaveAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceSaveAllCommentsDataWorker: DeviceSaveAllCommentsDataWorkerDelegate {
    func createData(comments: [Comment], success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let saveService = DeviceSaveAllCommentsDataService()

        saveService.createAllData(comments: comments) { (result) in
            success(result)
        } fail: { (message) in
            fail(message)
        }
    }
}
