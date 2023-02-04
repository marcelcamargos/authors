//
//  DeviceDeletionAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceDeletionAllDataWorker: DeviceDeletionAllDataWorkerDelegate {
    func deleteAllData(entityName: String, success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionAllDataService()
        service.deleteAllData(entityName: entityName) { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
