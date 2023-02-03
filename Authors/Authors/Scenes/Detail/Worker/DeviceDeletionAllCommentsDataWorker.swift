//
//  DeviceDeletionAllCommentsDataWorker.swift
//  Authors
//
//  Created by Marcel Camargos on 02/02/23.
//

import Foundation

class DeviceDeletionAllCommentsDataWorker: DeviceDeletionAllCommentsDataWorkerDelegate {
    func deleteAllCommentsData(success: @escaping (Bool) -> (), fail: @escaping (String) -> ()) {
        let service = DeviceDeletionAllCommentsService()
        service.deleteAllCommentsData() { (deleted) in
            success(deleted)
        } fail: { (message) in
            fail(message)
        }
    }
}
