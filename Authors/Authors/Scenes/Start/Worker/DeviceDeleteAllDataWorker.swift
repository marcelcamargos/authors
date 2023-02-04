//
//  DeviceDeleteAllDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 01/02/23.
//

import Foundation

class DeviceDeleteAllDataWorker: DeviceDeleteAllDataWorkerDelegate {
    func deleteAllData(entityName: String, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionAllDataService()
        service.deleteAllData(entityName: entityName) { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
