//
//  DeviceDeletionAllUserDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceDeletionAllUserDataWorker: DeviceDeletionAllUserDataWorkerDelegate {
    func deleteAllUserData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionAllUserDataService()
        service.deleteAllUserData() { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
